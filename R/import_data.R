#' Import data into R session
#'
#' @description Allows you to import a file either using an user-specified file path or interactively.
#'
#' @param file_path Absolute path of the file. It will be prompted to choose file interactively if missing
#'
#' @return File as R object
#' @export
#'
#' @examples
#'\dontrun{
#' data = import_data()
#' }
#'
import_data = function(file_path = NULL) {

  # find file path
  if(missing(file_path)) { # if file_path not specified

    file = file.choose()

    file_path = normalizePath(file,
                              winslash = "/")

  } else { # if user specified file path

    file_path = file_path
  }

  # find file extension
  doc_ext = tools::file_ext(file_path)

  # import data using an appropriate function
  if ( doc_ext == "csv" ) {

    data = readr::read_csv(file_path,
                           locale = readr::locale(encoding = "UTF-8"))

  } else if(doc_ext == "xlsx") {

    data = readxl::read_xlsx(file_path)

  } else if(doc_ext == "xls") {

    data = readxl::read_xls(file_path)

  } else if(doc_ext == "rds") {

    data = readr::read_rds(file_path)
  }

  return(data)
}
