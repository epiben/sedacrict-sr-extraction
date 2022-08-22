server <- function(session, input, output) {

  # === LOGIN PART ===

  # call the server part
  # check_credentials returns a function to authenticate users
  res_auth <- secure_server(
    check_credentials = check_credentials(credentials)
  )

  output$auth_output <- renderPrint({
    reactiveValuesToList(res_auth)
  })

  # ==== SERVER LOGIC ===

  EXTRACTOR <- reactive({
    # reactiveValuesToList(res_auth)$user
    "BSKH"
  })

  make_conn <- function() dbConnect(SQLite(), "data/sedacrict_scoping_review.db")

  save_data <- function(input_as_json, extraction_done = 0) {
    conn <- make_conn()

    # No longer pending
    extractor_group <- if (EXTRACTOR() == "BSKH") "bskh" else "rest"
    dbExecute(conn, glue("UPDATE rcts SET pending_{extractor_group} = 0 WHERE rct_name = '{input$rct_name}'"))

    # Remove old versions, if they exist
    dbExecute(
      conn,
      sprintf(
        "DELETE FROM extractions WHERE rct_name = '%s' AND extractor = '%s';",
        input$rct_name, EXTRACTOR()
      )
    )

    # Insert current version
    dbWriteTable(
      conn,
      "extractions",
      tibble(
        rct_name = input$rct_name,
        extractor = EXTRACTOR(),
        extracted_data = input_as_json,
        extraction_done = extraction_done
      ),
      append = TRUE
    )

    for (cim in input$causal_inference_methods) {
      print(cim)
      x <- dbGetQuery(conn, glue("SELECT * FROM causal_inference_methods WHERE method_name = '{cim}'"))
      if (nrow(x) == 0) {
        dbExecute(conn, glue("INSERT INTO causal_inference_methods VALUES ('{cim}', '{md5(cim)}')"))
      }
    }

    dbDisconnect(conn)
  }

  submit_extraction <- function(input_as_json) {
    save_data(input_as_json, extraction_done = 1)
  }

  defaults <- reactive({
    conn <- make_conn()
    res <- dbGetQuery(
      conn,
      sprintf(
        "SELECT extracted_data FROM extractions WHERE extractor = '%s' AND rct_name = '%s'",
        EXTRACTOR(),
        input$rct_name
      )
    )
    dbDisconnect(conn)

    tryCatch(fromJSON(as.character(res)), error = function(err) list())
  })

  pruned_data_as_json <- reactive({
    items_to_remove <- c(
      "sidebarItemExpanded",
      "sidebarCollapsed",
      "shinyjs-resettable-form",
      "cancel"
    )

    input_as_list <- reactiveValuesToList(input)

    ci_items_to_remove <- input_as_list[grepl("cim_id_[0-9a-z]{32}__name", names(input_as_list))] %>%
      keep(~ !. %in% input$causal_inference_methods) %>%
      names() %>%
      str_extract("cim_id_[0-9a-z]{32}__") %>%
      map(~ paste0(., c("estimation_technique", "name", "software_languages", "software_libraries"))) %>%
      unlist()

    idx_to_remove <- names(input_as_list) %in% c(items_to_remove, ci_items_to_remove)
    ordered_names <- sort(names(input_as_list[!idx_to_remove]))
    final_data <- input_as_list[ordered_names]

    # Add metadata
    final_data$timestamp <- paste(now("UTC"), "UTC")
    final_data$extractor <- EXTRACTOR()

    toJSON(final_data)
  })

  # When the Submit button is clicked, submit the response
  observeEvent(input$submit, {

    # User-experience stuff
    shinyjs::disable("submit")
    shinyjs::show("submit_msg")
    shinyjs::hide("error")

    # Save the data (show an error message in case of error)
    tryCatch({
      submit_extraction(pruned_data_as_json())
      shinyjs::reset("form")
      shinyjs::show("thankyou_msg")
      shinyjs::hide("form")
      updateTextInput(session, "rct_selector_kicker", value = now())
    },
    error = function(err) {
      shinyjs::html("error_msg", err$message)
      shinyjs::show(id = "error", anim = TRUE, animType = "fade")
    },
    finally = {
      shinyjs::enable("submit")
      shinyjs::hide("submit_msg")
    })
  })

  observeEvent(input$submit_another, {
    shinyjs::show("form")
    shinyjs::reset("form")
    shinyjs::hide("thankyou_msg")
  })

  observeEvent(input$save, {
    updateTextInput(session, "rct_selector_kicker", value = now())
    save_data(pruned_data_as_json())
  })


  observeEvent(input$cancel, {
    updateTextInput(session, "rct_selector_kicker", value = now())
    reset("form")
  })

  observeEvent(input$trial_stopped_early, {
    if (input$trial_stopped_early == "yes") {
      shinyjs::show("trial_stopped_reason")
      shinyjs::show("trial_stopped_predefined_rule")
      if (input$trial_stopped_reason == "N/A") {
        updateTextInput(session, "trial_stopped_reason", value = "")
      }
    } else {
      shinyjs::hide("trial_stopped_reason")
      shinyjs::hide("trial_stopped_predefined_rule")
      updateTextInput(session, "trial_stopped_reason", value = "N/A")
      updateRadioButtons(session, "trial_stopped_reason", choices = yes_no_choices, selected = character(0))
    }
  })

	# REACTIVE DATA ELEMENTS ====

  output$the_form <- renderUI({
    req(input$rct_name)

    conn <- make_conn()
    causal_inference_methods <- dbGetQuery(conn, "SELECT method_name FROM causal_inference_methods ORDER BY method_name") %>%
      as.list()
    dbDisconnect(conn)

    tagList(
      fluidRow(
        box(width = 6,
            textInput("doi_principal_report", "DOI of principal report", width = "100%", value = defaults()$doi_principal_report),
            selectizeInput("journal_principal_report", "Journal of principal report", width = "100%", choices = valid_journals, selected = defaults()$journal_principal_report %||% character(0), size = length(valid_journals)),
            textInput("publication_year_principal_report", "Publication year, principal report", width = "100%", value = defaults()$publication_year_principal_report, placeholder = "E.g. 2019"),
            textInput("recruitment_period", "Recruitment period", width = "100%", value = defaults()$recruitment_period, placeholder = "E.g. 2/2015-10/2020"), # TODO: consider validation (validate()/need())
            textInput("n_enrolled_participants", "No. enrolled participants", width = "100%", value = defaults()$n_enrolled_participants), # TODO: consider validation (validate()/need())
            textInput("n_centres", "No. centres", width = "100%", value = defaults()$n_centres) # TODO: consider validation (validate()/need())
        ),
        box(width = 6,
            textInput("trial_phase", "Phase of trial", value = defaults()$trial_phase, placeholder = "E.g. IIa og III"),
            radioButtons("intervention_type", "Intervention type", width = "100%", choices = intervention_types, selected = defaults()$intervention_type %||% character(0)),
            radioButtons("only_covid_patients", "Trial restricted to COVID19 patients?", choices = yes_no_choices, selected = defaults()$only_covid_patients %||% character(0)),
            radioButtons("trial_stopped_early", "Trial stopped early?", choices = yes_no_choices, selected = defaults()$trial_stopped_early %||% character(0)),
            hidden(textInput("trial_stopped_reason", "Reason for terminating trial", value = defaults()$trial_stopped_reason, placeholder = "E.g. futility or superiority")),
            hidden(radioButtons("trial_stopped_predefined_rule", "Terminated using predefined rule?", choices = yes_no_choices, selected = defaults()$trial_stopped_predefined_rule %||% character(0)))
        )
      ),
      fluidRow(
        box(width = 6, title = "Causal inference methods", collapsible = TRUE,
            selectizeInput("causal_inference_methods", label = NULL, choices = causal_inference_methods, multiple = TRUE,
                           width = "100%", selected = defaults()$causal_inference_methods %||% character(0), options = list(create = TRUE)),
            uiOutput("dynamic_ci_fields")
        ),
        box(width = 6, title = "Datasets used", collapsible = TRUE,
            textInput("n_datasets", label = NULL, width = "100%", value = defaults()$n_datasets, placeholder = "Number of datasets"),
            uiOutput("dynamic_dataset_fields")
        )
      )
    )
  })

	# REACTIVE INPUT FIELDS ====
  output$rct_selector <- renderUI({
    req(input$rct_selector_kicker)

    extractor_group <- if (EXTRACTOR() == "BSKH") "bskh" else "rest"
    conn <- make_conn()
    choices <- dbGetQuery(conn, glue(
      "SELECT rct_name FROM rcts WHERE pending_{extractor_group} == 1
      UNION ALL
      SELECT rct_name FROM extractions WHERE extractor = '{EXTRACTOR()}'
        AND extraction_done = 0;
      ",
    )) %>%
      as.list() %>%
      c("", .)
    dbDisconnect(conn)

    selectizeInput("rct_name", label = NULL, choices = choices, width = "100%", selected = "")
  })

	output$dynamic_ci_fields <- renderUI({
	  req(input$rct_name)

		set_up_fields <- function(m) {
			id_prefix <- sprintf("cim_id_%s__", md5(m, key = "4131"))
			box(width = 6,
			  h4(m, style = "color:darkorange"),
			  hidden(textInput(paste0(id_prefix, "name"), label = NULL, value = m)),
				selectizeInput(paste0(id_prefix, "estimation_technique"), "Estimation technique", selected = defaults()[[paste0(id_prefix, "estimation_technique")]], choices = estimation_techniques, multiple = TRUE, options = list(create = TRUE)),
				selectizeInput(paste0(id_prefix, "software_languages"), "Software, language(s)", selected = defaults()[[paste0(id_prefix, "software_languages")]], choices = software_languages, multiple = TRUE, options = list(create = TRUE)),
				selectizeInput(paste0(id_prefix, "software_libraries"), "Software, library/ies", selected = defaults()[[paste0(id_prefix, "software_libraries")]], choices = software_libraries, multiple = TRUE, options = list(create = TRUE))
			)
		}

		if ("None" %in% input$causal_inference_methods) {
		  id_prefix <- sprintf("cim_id_%s__", md5("None", key = "4131"))
		  hidden(textInput(paste0(id_prefix, "name"), "name", "None"))

		  fluidRow(
		    column(6,
		      textInput(paste0(id_prefix, "corresponding_author_name"), "Corresponding author's name", value = defaults()[[paste0(id_prefix, "corresponding_author_name")]], width = "100%")
		    ),
		    column(6,
		      textInput(paste0(id_prefix, "corresponding_author_email"), "Corresponding author's email", value = defaults()[[paste0(id_prefix, "corresponding_author_email")]], width = "100%")
		    )
		  )


		  # TODO: add also corresponding author info so we can collect that

		} else {
		  lapply(input$causal_inference_methods, set_up_fields)
		}
	})

	output$dynamic_dataset_fields <- renderUI({
	  req(input$n_datasets)

	  set_up_fields <- function(i) {
			id_prefix <- sprintf("dataset_id_%s__", i)
			box(width = 6,
			  h4(sprintf("Dataset #%i", i), style = "color:dodgerblue"),
			  textInput(paste0(id_prefix, "dataset_name"), "Name of dataset", value = defaults()[[paste0(id_prefix, "dataset_name")]], width = "100%"),
			  selectizeInput(paste0(id_prefix, "countries"), "Country/ies of origin", selected = defaults()[[paste0(id_prefix, "countries")]], choices = countries, multiple = TRUE, options = list(create = TRUE)),
			  textInput(paste0(id_prefix, "n_subjects"), "No. subjects", value = defaults()[[paste0(id_prefix, "n_subjects")]], width = "100%"), # TODO: consider validation (validate()/need())
			  selectizeInput(paste0(id_prefix, "patient_population"), "Patient population", choices = patient_populations, selected = defaults()[[paste0(id_prefix, "patient_population")]], multiple = TRUE, options = list(create = TRUE))
			)
		}

		lapply(seq_len(parse_integer(input$n_datasets)), set_up_fields)
	})

	# REACTIVE OUTPUTS


	data_file_path <- reactive({
	  file.path("data", sprintf("%s_%s.yaml", input$rct_name, EXTRACTOR()))
	})

	output$full_data_extraction <- renderText({
	  # cat(pruned_data_as_yaml())
	  fromJSON(pruned_data_as_json())
	})
}

server
