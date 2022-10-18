#' Quickly compute the absolute numbers and proportions of unique values
#'
#' @param data name of the data frame
#' @param x name of the variable
#'
#'
#' @return A table with the absolute number (n) and proportion (pct) of each level
#' @export
#'
#' @author Chris Ganowski, \email{chris.ganowski@ontario.ca}
#'
#' @examples
#'
#' d = data.frame(letters = sample(LETTERS[1:6], size = 100, replace = TRUE))
#' num_pct(d, letters)
#'
num_pct = function(data, x) {
  data %>%
    dplyr::count(!!rlang::ensym(x),
                 sort = T,
                 name = "n") %>%
    dplyr::mutate(pct = round(n /sum(n), 2)) %>%
    janitor::adorn_totals()
}



