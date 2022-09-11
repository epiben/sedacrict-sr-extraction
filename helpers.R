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

# define some credentials
credentials <- data.frame(
  user = c("BSKH", "JM"), # mandatory
  password = c("4131bskh", "4131jm"), # mandatory
  start = c("2019-04-15"), # optional (all others)
  # expire = c(NA, "2019-12-31"),
  admin = c(TRUE, TRUE),
  comment = "None",
  stringsAsFactors = FALSE
)

# Fixed choice lists
intervention_types <- list("Drug", "Device", "Management")
yes_no_choices <- list("No", "Yes")



