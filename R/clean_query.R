#' Clean SQL query
#'
#' A function developed by Tori Oblad; See the original \href{https://stackoverflow.com/a/58446028}{thread} for details.
#'
#' @param text_or_path a text SQL query or path to a sql file
#'
#' @return A single string output
#' @export
#'
#' @author Tori Oblad
#' @references \url{https://stackoverflow.com/a/58446028}
#'
#' @examples
#'
#'
#' query <- "
#' /* this query has
#' intentionally messy
#' comments
#' */
#'
#' Select
#' COL_A -- with a comment here
#' ,COL_B
#' ,COL_C
#' FROM
#' -- and some helpful comment here
#' Database.Datatable
#' ;
#' -- or wherever
#'
#' /* and some more comments here */
#'
#' "
#'
#' clean_query(query)
#'
clean_query <- function( text_or_path = '//example/path/to/some_query.sql' ){

  # if sql path, read, otherwise assume text input
  if( stringr::str_detect(text_or_path, "(?i)\\.sql$") ){
    text_or_path <- text_or_path %>%
      readr::read_lines() %>%
      stringr::str_c(sep = " ", collapse = "\n")
  }

  # echo original query to the console
  #  (unnecessary, but helpful for status if passing sequential queries to a db)
  cat("\nThe query you're processing is: \n", text_or_path, "\n\n")

  # return
  text_or_path %>%
    # remove all demarked /*  */ sql comments
    gsub(pattern = '/\\*.*?\\*/', replacement = ' ') %>%
    # remove all demarked -- comments
    gsub(pattern = '--[^\r\n]*', replacement = ' ') %>%
    # remove everything after the query-end semicolon
    gsub(pattern = ';.*', replacement = ' ')
  # #remove any line break, tab, etc.
  # gsub(pattern = '[\r\n\t\f\v]', replacement = ' ')
  # # remove extra whitespace
  # #gsub(pattern = ' +', replacement = ' ')
}
