library(tidyverse)

## The 2021 Census – Geographic Attribute File
## "2021_92-151_X.csv" is an unzipped file that can be downloaded here: https://www12.statcan.gc.ca/census-recensement/2021/geo/aip-pia/attribute-attribs/index2021-eng.cfm?year=2021
geo_on_er_cd_names =
  readr::read_csv(here::here("data-raw",
                             "2021_92-151_X.csv"),
                  col_types = cols(
                    PRUID_PRIDU = col_character(),
                    CDUID_DRIDU = col_character(),
                    ERUID_REIDU = col_character(),
                    ERDGUID_REIDUGD = col_character()
                  )) %>%
  # make column names lower cases
  dplyr::rename_all(tolower) %>%
  filter(pruid_pridu == "35") %>%
  distinct(
    across(c(
      erdguid_reidugd,
      eruid_reidu,
      ername_renom,
      cddguid_dridugd,
      cduid_dridu,
      cdname_drnom)
    )
  ) %>%
  mutate(ca_name = case_when( eruid_reidu != "3530" ~ ername_renom,
                              eruid_reidu == "3530" ~ cdname_drnom,
                              TRUE ~ NA_character_
  )
  ) %>%
  rename(cduid = cduid_dridu)

cd_estca =
  read_csv(here::here("data-raw", "CD_ESTCA.csv"),
           col_types = cols(
             CDUID = col_character(),
             PRUID = col_character(),
             EST_REGION_ID = col_character()
             )
           ) %>%
  rename_all(tolower)



geo_on_er_cd_names =
  left_join(geo_on_er_cd_names,
          cd_estca,
          by = "cduid") %>%
  select(est_region,
         est_region_id,
         cdname,
         cduid,
         cddguid_dridugd,
         cdtype,
         ername_renom,
         eruid_reidu,
         erdguid_reidugd) %>%
  arrange(cduid)


## code to prepare `geo_on_er_cd_names` dataset goes here

usethis::use_data(geo_on_er_cd_names,
                  overwrite = TRUE)
