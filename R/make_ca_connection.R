#' Make connection to CDR
#' @description Creates a connection object using an ODBC driver with the log-in credentials saved in the system environment variables as "userid" (user ID) and "pwd" (password); check this instruction:
#'  \code{vignette("Use ODBC login as environment variables", package = "autemplates")}
#'
#' @param dsn name of the DB's service name (SERVICE_NAME) to connect; the default is CDR
#'
#' @return a connection object to Centralized Data Repository
#' @export
#'
#' @examples make_ca_connection(dsn = "CDR")
#'

make_ca_connection = function(dsn = "CDR") {

  if( length(grep("id", names(Sys.getenv()))) > 1 ) {

    userid = rstudioapi::askForPassword("ODBC user ID")
    pwd = rstudioapi::askForPassword("password")

  } else if (length(grep("id", names(Sys.getenv()))) == 1 ) {

    userid = Sys.getenv(names(Sys.getenv())[grep("id", names(Sys.getenv()))])
    pwd = Sys.getenv(names(Sys.getenv())[grep("pwd", names(Sys.getenv()))])

  }



  # make connection ------
  con =
    odbc::dbConnect(odbc::odbc(),
                    Trusted_Connection = TRUE,
                    timeout = 15,
                    dsn = dsn,
                    encoding = "latin1", # for french words
                    uid = userid,
                    pwd = pwd)

  return( con )

}
