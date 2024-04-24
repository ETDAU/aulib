#' catchment area and the phase

est_catchment =
  tibble::tribble(
    ~catchment,      ~phase,                                                                      ~SSM,
    "Hamilton - Niagara", "Prototype",                                                           "FEDCAP CANADA",
    "Muskoka - Kawarthas", "Prototype",                                                         "Fleming College",
    "Peel", "Prototype", "International APM Group Pty Ltd. and WCG International Consultants Ltd.",
    "Halton",    "Phase1",                                                           "FEDCAP CANADA",
    "Kingston - Pembroke",    "Phase1",                                                       "Serco Canada Inc.",
    "Stratford - Bruce Peninsula",    "Phase1",                                                         "County of Bruce",
    "York",    "Phase1", "International APM Group Pty Ltd. and WCG International Consultants Ltd.",
    "Durham",    "Phase2",                                     "The Regional Municipality of Durham",
    "Kitchener - Waterloo - Barrie",    "Phase2",                                                       "Serco Canada Inc.",
    "London",    "Phase2",                                       "Corporation of the City of London",
    "Ottawa",    "Phase2", "International APM Group Pty Ltd. and WCG International Consultants Ltd.",
    "Windsor - Sarnia",    "Phase2",                                  "The Corporation of the City of Windsor"
  )

usethis::use_data(est_catchment, overwrite = TRUE)
