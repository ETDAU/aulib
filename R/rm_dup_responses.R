#' Remove duplicated entries in a response
#'
#' @description Removes repeated responses that are concatenated together (e.g., "yes, yes")
#' by retaining only the first occurrence of the response
#'
#'
#' @param response name of the column that contains duplicated responses
#' @param sep separator of the duplicated entries; default is comma (",")
#'
#' @return a single response without a duplicate
#' @export
#'
#' @examples
#' duplicated_response = c("yes, yes", "no", "yes, no")
#' rm_dup_responses(response = duplicated_response, sep = ",")
#'
rm_dup_responses = function(response, sep = ",") {
  stringr::str_replace_all(tolower(response),
                           paste0("\\b(\\w+)", sep, "\\s+\\1\\b"), # pattern of duplicated responses
                           "\\1") # replacing it with the first occurrence

}
