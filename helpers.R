library(shiny)
library(shinymanager)
library(shinydashboard)
library(shinyjs)
library(dplyr)
library(lubridate)
library(readr)
library(purrr)
library(rjson)
library(openssl)
library(RPostgres)
library(stringr)
library(glue)

credentials <- read_tsv("internal/login_details.tsv")

# Fixed choice lists
intervention_types <- list("Drug", "Device", "Management")
yes_no_choices <- list("No", "Yes")



