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

`%||%` <- function(a, b) if(is.null(a)) b else a

# Generate list of RCTs to choose from
# -- only non-finished
rcts_to_extract <- list(
  "--- Choose RCT ---",
  "HOT-COVID",
  "SUP-ICU",
  "CLASSIC"
)

# Flexible choice lists
# -- dynamically updated throughout extraction
causal_inference_methods <- list(
  "Generalised linear model",
  "Propensity-score based",
  "Stratification-score based",
  "Hierarchical modelling",
  "Counterfactuals-as-missing",
  "Pre-specified DAG",
  "Causal discovery",
  "Causal structure learning",
  "None"
)

# Fixed choice lists
valid_journals <- list(
  "American Journal of Respiratory and Critical Care Medicine",
  "BMJ",
  "Chest",
  "Critial Care",
  "Critical Care Medicine",
  "Intensive Care Medicine",
  "JAMA",
  "The Lancet",
  "The Lancet Respiratory Medicine",
  "New England Journal of Medicine"
)

estimation_techniques <- list("Frequentist", "Bayesian", "N/A")

intervention_types <- list("Drug" = "drug", "Medical device" = "medical_device", "Management" = "management")
yes_no_choices <- list("No" = "no", "Yes" = "yes")
software_languages <- list("R", "Python", "SPSS", "SAS", "Stata", "N/A")
software_libraries <- list("dummy package1", "dummy package2", "N/A")
patient_populations <- list("In-hospital", "Internal medicine", "Surgical", "Critically ill", "Primary sector", "Previous RCT(s)", "N/A")

countries <- read_csv("country_names_codes.csv", locale = locale(encoding = "iso-8859-1"),
                      col_select = c(code = "Code", name = "English Name")) %>%
  with(setNames(as.list(code), name)) %>%
  c(list("N/A" = "N/A"))

recruitment_months <- c("Unreported", 1:12) # 0 = unreported
recruitment_years <- c("Unreported", 2022:1990)


mandatory_fields <- c("doi_principal_report", "causal_inference_methods", "n_datasets")

find_choice <- function(selected, choice_list) {
  names(choice_list)[choice_list == selected]
}
