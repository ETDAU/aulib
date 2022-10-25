#' Census geography correspondence names
#'
#' A subset of data from Statistics Canada (Census year 2021) containing
#' economic regions, census divisions and IES catchment areas.
#'
#' @source <https://www12.statcan.gc.ca/census-recensement/2021/geo/aip-pia/attribute-attribs/index2021-eng.cfm?year=2021>
#' @format A data frame with 50 unique census divisions and 7 columns:
#' \describe{
#' \item{est_region}{EST region name.}
#' \item{est_region_id}{Uniquely identifies an EST region.}
#' \item{cdname}{Census division name.}
#' \item{cduid}{Uniquely identifies a census division.}
#' \item{cddguid_dridugd}{Dissemination Geography Unique Identifier for 2021 census divisions.}
#' \item{cdtype}{Census division type.}
#' \item{ername_renom}{Economic region name}
#' \item{eruid_reidu}{Uniquely identifies an economic region.}
#' \item{erdguid_reidugd}{Dissemination Geography Unique Identifier for 2021 economic regions.}
#' }
#' @examples
#'   geo_on_er_cd_names
"geo_on_er_cd_names"
