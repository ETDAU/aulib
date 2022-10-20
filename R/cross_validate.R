#' Cross validate categorical coding of transformed variables
#'
#' @param data dataset of original and transformed variables to be cross validated
#' @param codebook if TRUE, the function produces a codebook of
#'  original and transformed variables; if false, the function returns data frames of each transformed variable
#' @param suffix a string vector of suffix(es) used to name transformed variables.
#'
#' @return data frame(s) or a codebook
#' @export
#'
#' @example inst/examples/ex-cross_validate.R
cross_validate = function(data,
                          codebook = FALSE,
                          suffix = c("yn", "num", "stdz", "freq", "recency")) {

  #' all the suffixes for the transformed columns
  suffix_trans = paste0("_(", paste0(suffix, collapse = "|"), ")$")


  #' Columns that have too many levels
  too_many_levels = names(data)[sapply(data,
                     function(x) dplyr::n_distinct(x)) > 35]

  if(length(too_many_levels) != 0 ){
    warning(paste0("Column(s) with too many levels ("),
            paste(too_many_levels, collapse = ", "),
            paste0(") were excluded."))
  }

  # subset data by removing columns that have too many levels (36+)
  data = data[sapply(data,
                     function(x) length(unique(x))) < 36 ]

  #' find the names of columns that have(`transformed_columns`) been transformed (`original_columns`) and their original
  original_columns = names(data)[!grepl(suffix_trans, names(data))]
  transformed_columns = names(data)[grepl(suffix_trans, names(data))]

  #' create a codebook for both original and transformed columns
  option_codebook =
    #' every combination of the original columns and the suffixes
    expand.grid(original_columns,
                paste0("_", suffix, "$")) %>%
    #' find the original column and its transformed column(s), if any
    dplyr::mutate(Var2 = dplyr::case_when(
      grepl(paste0(transformed_columns, collapse = "|"),
            paste0(Var1, Var2)) ~
        paste0(Var1, "($|", Var2, ")"),
      TRUE ~ paste0(Var1, "$"))
    ) %>%
    dplyr::distinct(Var2) %>%
    purrr::flatten() %>%
    #' select the original column and transformed columns
    purrr::map(~dplyr::distinct(data,
                                dplyr::across(
                                  dplyr::matches(paste0(.x, "$")))
               )) %>%
    purrr::map(~dplyr::filter(.x,
                              !dplyr::if_all(.cols = tidyselect::everything(),
                                             is.na)))


  #' flattened codebook for the original columns
  opt_original_columns =
    option_codebook %>%
    purrr::keep( ~ncol(.x) == 1 ) %>%
    {tibble::tibble(
      variable = purrr::map_chr(., ~colnames(.)),
      response = purrr::map(., 1)
    )}


  #' flattened codebook for the transformed columns
  opt_transformed_columns =
    option_codebook %>%
    purrr::keep( ~ncol(.x) > 1 ) %>%
    #' numeric values and their corresponding labels
    purrr::map(~{dplyr::group_by_at(.x, 2) %>%
        dplyr::summarize_all(paste0, collapse = ", ") %>%
        dplyr::ungroup() %>%
        tidyr::unite("recoded",
                     tidyselect::everything(),
                     na.rm = TRUE,
                     remove = FALSE,
                     sep = " = ")}) %>%
    {tibble::tibble(
      variable = purrr::map_chr(., ~colnames(.)[2]),
      response = purrr::map(., "recoded")
    )}

  #' output
  if( codebook == TRUE) {

    #' create a codebook with all the responses concatenated
    codebook =
      list(opt_original_columns, opt_transformed_columns) %>%
      purrr::map_dfr(tidyr::unnest, response) %>%
      #' concatenate all the possible options
      dplyr::group_by(variable) %>%
      dplyr::summarize(response_options = toString(sort(unique(response)))) %>%
      dplyr::ungroup()

  } else if( codebook == FALSE) {

    #' create a dataframe
    codebook =
      option_codebook %>%
      purrr::keep( ~ncol(.data) > 1 ) %>%
      purrr::map(dplyr::arrange_at, tidyselect::last_col()) %>%
      purrr::map(dplyr::select, tidyselect::last_col(), tidyselect::everything())
  }


  return(codebook)
}
