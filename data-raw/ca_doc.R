library(tidyverse)

# pull CA documentation from CDR
con = aulib::make_ca_connection()

ca_questions_definitions =
  odbc::dbGetQuery(con,
                   aulib::clean_query(
                     read_file(
                       here::here("data-raw", "CA_current_questions_and_Definitions.sql"))
                   )
  )

odbc::dbDisconnect(con)

# append `CA_ShortNames` that was manually created by the AU
ca_short_names =
  readr::read_csv(
    here::here("data-raw", "CA_ShortNames.csv")
  )

ca_doc =
  inner_join(ca_questions_definitions,
             ca_short_names,
             by = "QUESTION_CODE_ID") %>%
  select(QUESTION_SHORT_EN, QUESTION_SHORT_ALIAS_EN,
         tidyselect::everything())

ca_doc =
  ca_doc %>%
  # dplyr::rename_all(
  #   tolower
  # ) %>%
  mutate(
    QUESTION_SHORT_EN = tolower(QUESTION_SHORT_EN)
  )

## code to prepare `ca_doc` dataset goes here

usethis::use_data(
  ca_doc,
  overwrite = TRUE
  )
