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


  yn_test = grepl("\\bno\\b|\\byes\\b",
                  unique(response),
                  ignore.case = TRUE)

  if ( length(which(yn_test == FALSE)) > 0 ) {


    wrong_values = unique(response)[!yn_test]

    warning("Please make sure all responses are either yes or no. ",
            paste(wrong_values, collapse = ", "), " were re-coded as NA.")

  }


  response = dplyr::case_when( grepl( "\\bno\\b", response, ignore.case = TRUE) ~ 0L,
                    grepl( "\\byes\\b", response, ignore.case = TRUE) ~ 1L,
                    TRUE ~ NA_integer_)

  return(response)

}
