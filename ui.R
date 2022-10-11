source("helpers.R")

body <- dashboardBody(

  useShinyjs(), # initialise shinyjs to enable its features

  hidden(div(
    id = "logged_in_as_final",
    h4("Logged in as FINAL user!", style = "color:red"),
  )),

  hidden(div(
    id = "thankyou_msg",
    h4("Extraction submitted successfully!"),
    actionLink("submit_another", "Click here to extract another.")
  )),

  div(
    id = "form",

    fluidRow(column(12, h4("Choose RCT"))),

    fluidRow(
      column(6,
        hidden(textInput("rct_selector_kicker", label = NULL, value = now())), # helper to enforce updating RCT selector after submitting
        uiOutput("rct_selector")
      ),
      column(width = 2,
        hidden(actionButton("submit", "Submit", style = "background-color:green; color:white", width = "100%")),

        hidden(
          span(id = "submit_msg", "Submitting..."),
          div(id = "error",
              div(br(), tags$b("Error: "), span(id = "error_msg"))
          )
        )
      ),
      column(width = 2,
        hidden(actionButton("save", "Save", style = "background-color:grey; color:white", width = "100%"))
      ),
      column(width = 2,
        hidden(actionButton("cancel", "Cancel", style = "background-color:red; color:white", width = "100%"))
      )
    ),

    uiOutput("the_form"),

    uiOutput("progress_plot")
  )
)

ui <- dashboardPage(
  dashboardHeader(title = "sedacrict-SR extraction form"),
  dashboardSidebar(disable = TRUE),
  body
)

secure_app(ui)
