#' Re-code binary response into numeric values
#'
#' @param response name of the vector or column containing character strings of "yes" and "no"
#'
#' @return a numeric value of 0 for "no" and 1 for "yes"
#' @export
#'
#' @examples
#' response = c(sample(c("yes", "no"), 6, replace = TRUE), "YES")
#' binary_to_numeric(response)

binary_to_numeric = function(response) {

  if ( length(unique(tolower(response))) > 2 ) {


    wrong_values = unique(response)[-grepl("\\bno\\b|\\byes\\b",
                            unique(response),
                            ignore.case = TRUE)]

    warning("Please make sure all responses are either yes or no. ",
            paste(wrong_values, collapse = ", "), " were re-coded as NA.")

  }


  dplyr::case_when( grepl( "no", response, ignore.case = TRUE) ~ 0L,
                    grepl( "yes", response, ignore.case = TRUE) ~ 1L,
                    TRUE ~ NA_integer_)


}
