library(dplyr)
library(ggplot2)
library(glue)
library(lubridate)
library(openssl)
library(purrr)
library(readr)
library(rjson)
library(RPostgres)
library(shiny)
library(shinyBS)
library(shinydashboard)
library(shinyjs)
library(shinymanager)
library(stringr)

credentials <- read.csv("internal/login_details.csv", stringsAsFactors = FALSE)

# Fixed choice lists
intervention_types <- list("Drug", "Device", "Management")
yes_no_choices <- list("No", "Yes")

replace_na <- function(x, replace = NA) {
  x[is.na(x)] <- replace
  x
}



