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
library(RSQLite)
library(stringr)
library(glue)

# define some credentials
credentials <- data.frame(
  user = c("BSKH", "shinymanager"), # mandatory
  password = c("password", "12345"), # mandatory
  start = c("2019-04-15"), # optional (all others)
  expire = c(NA, "2019-12-31"),
  admin = c(TRUE, TRUE),
  comment = "Simple and secure authentification mechanism
  for single ‘Shiny’ applications.",
  stringsAsFactors = FALSE
)

# Fixed choice lists
intervention_types <- list("Drug", "Medical device", "Management")
yes_no_choices <- list("No", "Yes")



