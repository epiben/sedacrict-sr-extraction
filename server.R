server <- function(session, input, output) {

  # LOGIN LOGIC ====

  # call the server part
  # check_credentials returns a function to authenticate users
  res_auth <- secure_server(
    check_credentials <- check_credentials(credentials)
  )

  output$auth_output <- renderPrint({
    reactiveValuesToList(res_auth)
  })

  # HELPERS ====

  make_conn <- function() {
    dbConnect(
      drv = RPostgres::Postgres(),
      host = Sys.getenv("DBHOST"),
      user = Sys.getenv("DBUSER"),
      pass = Sys.getenv("DBPASS"),
      port = 5432,
      dbname = "sedacrict_sr_extraction",
    )
  }

  fetch_choices <- function(conn, col_name, table_name) {
    out <- dbGetQuery(conn, glue("SELECT {col_name} FROM {table_name}")) %>%
      unlist(use.names = FALSE) %>%
      sort()
    top_idx <- out %in% c("None")
    c(out[top_idx], out[!top_idx]) # ensure alphabetical order, but None at the top
  }

  make_links <- function(urls) {
    strsplit(urls %||% "", ", ") %>%
      unlist() %>%
      map(~ tagList(br(), if (grepl("^http", .)) { a(., href = ., target = "_blank") } else { . }))
  }

  save_data <- function(pruned_data, extraction_done = 0) {
    conn <- make_conn()

    # LOGIC FOR DYNAMIC DROP-DOWN FIELDS
    # Update causal inference methods and datasets in database
    for (cim in input$causal_inference_methods) {
      method_exists <- 1 == dbGetQuery(conn, glue("SELECT COUNT(method_name) FROM causal_inference_methods WHERE method_name = '{cim}'"))
      if (isFALSE(method_exists)) {
        dbExecute(conn, glue("INSERT INTO causal_inference_methods VALUES ('{cim}', '{md5(cim, key = '4131')}')"))
      }
    }

    for (dsn in input$dataset_names) {
      dataset_exists <- 1 == dbGetQuery(conn, glue("SELECT COUNT(dataset_name) FROM datasets WHERE dataset_name = '{dsn}'"))
      if (isFALSE(dataset_exists)) {
        dbExecute(conn, glue("INSERT INTO datasets VALUES ('{dsn}', '{md5(dsn, key = '4131')}')"))
      }
    }

    # Update database with remaining dynamic drop-down options
    update_db <- function(conn, regex, col_name, table_name) {
      input_as_list <- reactiveValuesToList(input)
      selected <- unlist(input_as_list[grepl(regex, names(input_as_list))])
      if (length(selected) > 0) {
        selected_as_string <- paste(sprintf("'%s'", selected), collapse = ", ")
        existing <- unlist(dbGetQuery(conn, glue("SELECT {col_name} FROM {table_name} WHERE {col_name} IN ({selected_as_string})")))
        to_add <- setdiff(selected, existing)
        if (length(to_add) > 0) {
          values_as_string <- paste0("('", to_add, "')", collapse = ", ")
          dbExecute(conn, glue("INSERT INTO {table_name} VALUES {values_as_string}"))
        }
      }
    }

    update_db(conn, "journal_principal_report", "journal_name", "journals")

    update_db(conn, "cim_id_.+__estimation_techniques", "technique_name", "estimation_techniques")
    update_db(conn, "cim_id_.+__software_languages", "language_name", "software_languages")
    update_db(conn, "cim_id_.+__software_libraries", "library_name", "software_libraries")

    update_db(conn, "dataset_id_.+__countries", "country_name", "countries")
    update_db(conn, "dataset_id_.+__populations", "population_name", "populations")
    update_db(conn, "dataset_id_.+__provenance", "provenance_name", "provenance")
    update_db(conn, "dataset_id_.+__data_types", "data_type_name", "data_types")
    update_db(conn, "dataset_id_.+__data_models", "data_model_name", "data_models")
    update_db(conn, "dataset_id_.+__vocabs", "vocab_name", "vocabs")

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
        extracted_data = toJSON(pruned_data),
        extraction_done = extraction_done
      ),
      append = TRUE
    )

    # No longer pending
    dbExecute(conn, glue("UPDATE rcts SET pending_{extractor_group()} = 0 WHERE rct_name = '{input$rct_name}'"))

    dbDisconnect(conn)
  }

  ascertain_required_fields <- function(pruned_input) {
    exempt_idx <- names(pruned_input) == "remarks"
    all(map_lgl(pruned_input[!exempt_idx], ~ isTRUE(nchar(.) > 0 & !is.null(.))))
  }

  # REACTIVE DATA OBJECTS ====

  EXTRACTOR <- reactive({
    reactiveValuesToList(res_auth)$user %||% "BSKH"
  })

  extractor_group <- reactive({
    switch(
      EXTRACTOR(),
      "BSKH" = "bskh",
      "FINAL" = "final",
      "rest"
    )
  })

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

    if (nrow(res) == 0) {
      # Use data already extracted, if available
      res <- dbGetQuery(
        conn,
        sprintf(
          "SELECT extracted_data FROM extractions WHERE extractor = 'initial' AND rct_name = '%s'",
          input$rct_name
        )
      )
    }
    dbDisconnect(conn)

    tryCatch(fromJSON(as.character(res)), error = function(err) list())
  })

  pruned_data <- reactive({
    shiny_items_to_remove <- c(
      "sidebarItemExpanded",
      "sidebarCollapsed",
      "shinyjs-resettable-form",
      "cancel",
      "open_covidence",
      "rct_selector_kicker",
      "save",
      "shinymanager_language",
      "shinymanager_where",
      "submit",
      "submit_another"
    )

    input_as_list <- reactiveValuesToList(input)

    if ("None" %in% input_as_list$causal_inference_methods) input_as_list$causal_inference_methods <- "None"
    ci_idx_to_remove <- str_extract(names(input_as_list), "cim_id_.+") %>%
      str_which(paste(md5(input$causal_inference_methods %||% "", key = "4131")), negate = TRUE)

    if ("None" %in% input_as_list$dataset_names) input_as_list$dataset_names <- "None"
    dataset_idx_to_remove <- str_extract(names(input_as_list), "dataset_id_.+") %>%
      str_which(paste(md5(input$dataset_names %||% "", key = "4131")), negate = TRUE)

    items_to_remove <- c(
      shiny_items_to_remove,
      names(input_as_list)[ci_idx_to_remove],
      names(input_as_list)[dataset_idx_to_remove]
    )
    idx_to_remove <- names(input_as_list) %in% items_to_remove
    ordered_names <- sort(names(input_as_list[!idx_to_remove]))
    final_data <- input_as_list[ordered_names]

    # Add metadata
    final_data$timestamp <- paste(now("UTC"), "UTC")
    final_data$extractor <- EXTRACTOR()

    final_data
  })

  # SAVING AND SUBMISSION LOGIC ====
  observeEvent(input$submit, {

    if (isFALSE(ascertain_required_fields(pruned_data()))) {
      showModal(
        modalDialog(
          title = "Mandatory field(s) missing",
          "At least one mandatory field has no value. ",
          "If this is a bug, hit Save and throw Ben an email with the RCT name.",
          easyClose = TRUE,
          label = "Got it!"
        )
      )
      return(NULL)
    }

    # User-experience stuff
    shinyjs::disable("submit")
    shinyjs::show("submit_msg")
    shinyjs::hide("error")

    tryCatch({
      save_data(pruned_data(), extraction_done = 1)
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
    save_data(pruned_data())
  })

  observeEvent(input$cancel, {
    updateTextInput(session, "rct_selector_kicker", value = now())
    reset("form")
  })

  # OBSERVERS ====

  observeEvent(input$open_covidence, {
    shinyjs::runjs(glue("window.open('{defaults()$covidence_link}', '_blank')"))
  })

  observeEvent(input$trial_stopped_early, {
    if (input$trial_stopped_early == "Yes") {
      shinyjs::show("trial_stopped_reason")
      shinyjs::show("trial_stopped_predefined_rule")
      if (input$trial_stopped_reason == "N/A") {
        updateTextInput(session, "trial_stopped_reason", value = "")
        updateRadioButtons(session, "trial_stopped_predefined_rule", choices = yes_no_choices, selected = character(0))
      }
    } else {
      shinyjs::hide("trial_stopped_reason")
      shinyjs::hide("trial_stopped_predefined_rule")
      updateTextInput(session, "trial_stopped_reason", value = "N/A")
      updateRadioButtons(session, "trial_stopped_predefined_rule", choices = "N/A", selected = "N/A")
    }
  })

  observeEvent(input$rct_name, {
    if (length(input$rct_name) == 0 | input$rct_name == "") {
      shinyjs::hide("submit")
      shinyjs::hide("save")
      shinyjs::hide("cancel")
    } else {
      shinyjs::show("submit")
      shinyjs::show("save")
      shinyjs::show("cancel")
    }
  })

  observeEvent(input$causal_inference_methods, {
    if ("None" %in% input$causal_inference_methods) {
      conn <- make_conn()
      updateSelectizeInput(session, "dataset_names", choices = fetch_choices(conn, "dataset_name", "datasets"), selected = "None")
      dbDisconnect(conn)
    }
  })

  observeEvent(input$intervention_type, {
    if (input$intervention_type == "Drug") {
      updateTextInput(session, "trial_phase", value = replace_na(defaults()$trial_phase, ""))
      shinyjs::show("trial_phase")
    } else {
      updateTextInput(session, "trial_phase", value = "N/A")
      shinyjs::hide("trial_phase")
    }
  })

  observeEvent(input$recruitment_period, {
    period_regex <- "^([0-9]|1[0-2])/(0000|19[0-9][0-9]|20[0-1][0-9]|202[0-2])-([0-9]|1[0-2])/(0000|19[0-9][0-9]|20[0-1][0-9]|202[0-2])$"
    if(!grepl(period_regex, input$recruitment_period) & isTRUE(nchar(input$recruitment_period) > 0)) {
      updateTextInput(session, "recruitment_period", label = "Recruitment period - INVALID FORMAT")
    } else {
      updateTextInput(session, "recruitment_period", label = "Recruitment period")
    }
  })

  observeEvent(input$n_randomised_participants, {
    if(!grepl("^\\d+$", input$n_randomised_participants) & isTRUE(nchar(input$n_randomised_participants) > 0)) {
      updateTextInput(session, "n_randomised_participants", label = "No. randomised participants - INVALID FORMAT")
    } else {
      updateTextInput(session, "n_randomised_participants", label = "No. randomised participants")
    }
  })

  observeEvent(input$n_centres, {
    if(!grepl("^\\d+$", input$n_centres) & isTRUE(nchar(input$n_centres) > 0)) {
      updateTextInput(session, "n_centres", label = "No. centres/sites - INVALID FORMAT")
    } else {
      updateTextInput(session, "n_centres", label = "No. centres/sites")
    }
  })

  observeEvent(EXTRACTOR(), {
    if (EXTRACTOR() == "FINAL") {
      shinyjs::show("logged_in_as_final")
    } else {
      shinyjs::hide("logged_in_as_final")
    }
  })

	# REACTIVE DATA ELEMENTS ====

  output$rct_selector <- renderUI({
    req(input$rct_selector_kicker)

    conn <- make_conn()
    choices <- dbGetQuery(conn, glue(
      "SELECT rct_name FROM rcts WHERE pending_{extractor_group()} = 1
      UNION ALL
      SELECT rct_name FROM extractions WHERE extractor = '{EXTRACTOR()}' AND extraction_done = 0;"
    )) %>%
      arrange(rct_name) %>%
      unlist(use.names = FALSE) %>%
      sample() %>% # minimise risk of several extractors "claiming" the same RCT
      c("", .)
    dbDisconnect(conn)

    selectizeInput("rct_name", label = NULL, choices = choices, width = "100%", selected = "")
  })


  output$the_form <- renderUI({
    req(input$rct_name)

    # Pull options for dynamic drop-downs
    conn <- make_conn()
    causal_inference_methods <- fetch_choices(conn, "method_name", "causal_inference_methods")
    journals <- fetch_choices(conn, "journal_name", "journals")
    datasets <- fetch_choices(conn, "dataset_name", "datasets")
    dbDisconnect(conn)

    tagList(
      # Help texts
      bsPopover(
        "recruitment_period", NULL,
        paste("Write 0 for missing month and 0000 for missing year.<br> If unavailable in ",
              "the principal report, it can often be found in the repository where the trial was registered."),
        trigger = "focus"
      ),
      bsPopover(
        "trial_phase", NULL,
        paste("Often available via e.g. ClinicalTrials.gov.<br> If not, make your best",
              "judgement as per e.g. <a href=\"https://en.wikipedia.org/wiki/Drug_development#Clinical_phase\" ",
              "target=\"_blank\">this overview</a>"),
        placement = "top",
        trigger = "focus"
      ),
      bsPopover(
        "causal_inference_methods", NULL,
        paste("NB! For predictive enrichment only. Simple sample-size estimation doesn't count.",
              "From the protocol: generalised linear model [although not strictly as causal",
              "inference method in itself], propensity-score based, stratification-score based, ",
              "hierarchical modelling, counterfactuals-as-missing, pre-specified DAG, ",
              "causal discovery, causal structure learning"),
        placement = "top",
        trigger = "focus"
      ),

      fluidRow(
        column(6,
          strong("Links to trial repositories:", ),
          make_links(defaults()$accession_urls)
        ),
        column(6,
          hidden(textInput("covidence_link", label = NULL, value = defaults()$covidence_link)),
          actionButton("open_covidence", "Click here to open Covidence record", style = "background-color:dodgerblue; color:white", width = "100%")
        )
      ),
      fluidRow(br()),
      fluidRow(
        box(width = 6,
          textInput("doi_principal_report", "DOI of principal report", width = "100%", value = defaults()$doi_principal_report),
          selectizeInput("journal_principal_report", "Journal of principal report", width = "100%", choices = c("", journals), selected = defaults()$journal_principal_report %||% character(0), options = list(create = TRUE)),
          textInput("publication_year_principal_report", "Publication year, principal report", width = "100%", value = defaults()$publication_year_principal_report, placeholder = "E.g. 2019"),
          textInput("recruitment_period", "Recruitment period", width = "100%", value = defaults()$recruitment_period, placeholder = "E.g. 2/2015-10/2020"), # TODO: consider validation (validate()/need())
          textInput("n_randomised_participants", "No. randomised participants", width = "100%", value = defaults()$n_randomised_participants), # TODO: consider validation (validate()/need())
          textInput("n_centres", "No. centres/sites", width = "100%", value = defaults()$n_centres) # TODO: consider validation (validate()/need())
        ),
        box(width = 6,
          radioButtons("intervention_type", "Intervention type", width = "100%", choices = intervention_types, selected = defaults()$intervention_type %||% character(0)),
          textInput("trial_phase", "Phase of trial", value = defaults()$trial_phase, placeholder = "E.g. 2a og 3"),
          radioButtons("only_covid_patients", "Trial restricted to COVID19 patients?", choices = yes_no_choices, selected = defaults()$only_covid_patients %||% character(0)),
          radioButtons("trial_stopped_early", "Trial stopped early?", choices = yes_no_choices, selected = defaults()$trial_stopped_early %||% character(0)),
          hidden(textInput("trial_stopped_reason", "Reason for terminating trial", value = defaults()$trial_stopped_reason %||% "N/A", placeholder = "E.g. futility or superiority")),
          hidden(radioButtons("trial_stopped_predefined_rule", "Terminated using predefined rule?", choices = if (is.null(defaults()$trial_stopped_predefined_rule) | isTRUE(defaults()$trial_stopped_predefined_rule == "N/A")) "N/A" else yes_no_choices, selected = defaults()$trial_stopped_predefined_rule %||% "N/A")),
          textAreaInput("remarks", "General remarks", value = defaults()$remarks, width = "100%", rows = 2)
        )
      ),
      fluidRow(
        box(width = 6, title = "Causal inference methods", collapsible = TRUE,
          selectizeInput("causal_inference_methods", label = NULL, choices = causal_inference_methods, multiple = TRUE,
                         width = "100%", selected = defaults()$causal_inference_methods %||% character(0), options = list(create = TRUE)),
          uiOutput("dynamic_ci_fields")
        ),
        box(width = 6, title = "Datasets used", collapsible = TRUE,
          selectizeInput("dataset_names", label = NULL, choices = datasets, multiple = TRUE,
                         width = "100%", selected = defaults()$dataset_names %||% character(0), options = list(create = TRUE)),
          uiOutput("dynamic_dataset_fields")
        )
      )
    )
  })

	output$dynamic_ci_fields <- renderUI({
	  req(input$rct_name)

	  # Pull options for dynamic drop-downs
	  conn <- make_conn()
	  estimation_techniques <- fetch_choices(conn, "technique_name", "estimation_techniques")
	  software_languages <- fetch_choices(conn, "language_name", "software_languages")
	  software_libraries <- fetch_choices(conn, "library_name", "software_libraries")
	  dbDisconnect(conn)

		set_up_fields <- function(m) {
			id_prefix <- sprintf("cim_id_%s__", md5(m, key = "4131"))
			box(width = 6,
			  h4(m, style = "color:darkorange"),
			  hidden(textInput(paste0(id_prefix, "name"), label = NULL, value = m)),
				selectizeInput(paste0(id_prefix, "estimation_techniques"), "Estimation technique(s)", selected = defaults()[[paste0(id_prefix, "estimation_techniques")]] %||% character(0), choices = estimation_techniques, width = "100%", multiple = TRUE, options = list(create = TRUE)),
				selectizeInput(paste0(id_prefix, "software_languages"), "Software, language(s)", selected = defaults()[[paste0(id_prefix, "software_languages")]] %||% character(0), choices = software_languages, width = "100%", multiple = TRUE, options = list(create = TRUE)),
				selectizeInput(paste0(id_prefix, "software_libraries"), "Software, library/ies", selected = defaults()[[paste0(id_prefix, "software_libraries")]] %||% character(0), choices = software_libraries, width = "100%", multiple = TRUE, options = list(create = TRUE))
			)
		}

		if ("None" %in% input$causal_inference_methods) {
		  id_prefix <- sprintf("cim_id_%s__", md5("None", key = "4131"))
		  tagList(
  		  hidden(textInput(paste0(id_prefix, "name"), "name", "None")),
  		  fluidRow(column(12,
          textInput(paste0(id_prefix, "title_principal_report"), "Title of principal report", value = defaults()[[paste0(id_prefix, "title_principal_report")]], width = "100%")
        )),
  		  fluidRow(
  		    column(6,
  		      textInput(paste0(id_prefix, "corresponding_author_name"), "Corresponding author's name", value = defaults()[[paste0(id_prefix, "corresponding_author_name")]], width = "100%")
  		    ),
  		    column(6,
  		      textInput(paste0(id_prefix, "corresponding_author_email"), "Corresponding author's email", value = defaults()[[paste0(id_prefix, "corresponding_author_email")]], width = "100%")
  		    )
  		  )
		  )
		} else {
		  lapply(input$causal_inference_methods, set_up_fields)
		}
	})

	output$dynamic_dataset_fields <- renderUI({
	  req(input$rct_name)

	  # Pull options for dynamic drop-downs
	  conn <- make_conn()
	  countries <- fetch_choices(conn, "country_name", "countries")
	  populations <- fetch_choices(conn, "population_name", "populations")
	  provenance <- fetch_choices(conn, "provenance_name", "provenance")
	  data_types <- fetch_choices(conn, "data_type_name", "data_types")
	  data_models <- fetch_choices(conn, "data_model_name", "data_models")
	  vocabs <- fetch_choices(conn, "vocab_name", "vocabs")
	  dbDisconnect(conn)

	  set_up_fields <- function(d) {
	    id_prefix <- sprintf("dataset_id_%s__", md5(d, key = "4131"))
	    box(width = 12,
	        h4(d, style = "color:dodgerblue"),
	        hidden(textInput(paste0(id_prefix, "name"), label = NULL, value = d)),
	        column(6,
  	        selectizeInput(paste0(id_prefix, "countries"), "Country/ies of origin", selected = defaults()[[paste0(id_prefix, "countries")]], choices = countries, multiple = TRUE, options = list(create = TRUE)),
  	        textInput(paste0(id_prefix, "n_subjects"), "No. subjects", value = defaults()[[paste0(id_prefix, "n_subjects")]], width = "100%"), # TODO: consider validation (validate()/need())
  	        selectizeInput(paste0(id_prefix, "populations"), "Patient population", choices = populations, selected = defaults()[[paste0(id_prefix, "populations")]], multiple = TRUE, options = list(create = TRUE)),
  	        selectizeInput(paste0(id_prefix, "provenance"), "Provenance", choices = provenance, selected = defaults()[[paste0(id_prefix, "provenance")]], multiple = TRUE, options = list(create = TRUE))
	        ),
	        column(6,
  	        selectizeInput(paste0(id_prefix, "data_types"), "Data types", choices = data_types, selected = defaults()[[paste0(id_prefix, "data_types")]], multiple = TRUE, options = list(create = TRUE)),
  	        selectizeInput(paste0(id_prefix, "data_models"), "Data model(s)", choices = data_models, selected = defaults()[[paste0(id_prefix, "data_models")]], multiple = TRUE, options = list(create = TRUE)),
  	        selectizeInput(paste0(id_prefix, "vocabs"), "Vocabularies/ontologies", choices = vocabs, selected = defaults()[[paste0(id_prefix, "vocabs")]], multiple = TRUE, options = list(create = TRUE)),
  	        radioButtons(paste0(id_prefix, "data_are_public"), "Are data publicly available?", choices = yes_no_choices, selected = defaults()[[paste0(id_prefix, "data_are_public")]] %||% character(0))
	        )
	    )
	  }

	  if ("None" %in% input$dataset_names) {
	    id_prefix <- sprintf("dataset_id_%s__", md5("None", key = "4131"))
	    hidden(textInput(paste0(id_prefix, "name"), "name", "None"))
	  } else {
	    lapply(input$dataset_names, set_up_fields)
	  }
	})
}

server
