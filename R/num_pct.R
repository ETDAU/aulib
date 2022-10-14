#' Quickly compute the absolute numbers and proportions of unique values
#'
#' @param data name of the data frame
#' @param x name of the variable
#'
#' @return A table with the absolute number (n) and proportion (pct) of each level
#' @export
#'
#' @examples
#'
#' data.frame(letters = sample(LETTERS[1:6], size = 100, replace = T)) %>%
#' num_pct(., letters)
#'
num_pct = function(data, x) {
  data %>%
    dplyr::count(!!ensym(x), sort = T) %>%
    dplyr::mutate(pct = round(n /sum(n), 2)) %>%
    janitor::adorn_totals()
}



