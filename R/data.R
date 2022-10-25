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

#' Documentation of Common Assessment (CA) Tools
#'
#' Documentation of CA data containing metadata and CAT questions.
#' Metadata was created using `data-raw/CA_Current_Questions_and_Definitions.sql`.
#'
#' @format A data frame containing metadata of CA data and information about CAT
#' \describe{
#' \item{QUESTION_SHORT_EN}{Computer-friendly name of CA questions}
#' \item{QUESTION_SHORT_ALIAS_EN}{Human-friendly CA questions}
#' \item{MODULE_SEQUENCE}{}
#' \item{GROUP_SEQUENCE}{}
#' \item{QUESTION_SEQUENCE}{}
#' \item{EST_CA_TEMPLATE_ID}{}
#' \item{VERSION_NUMBER}{}
#' \item{EFFECTIVE_FROM_DATE}{}
#' \item{MODULE_NAME_EN}{}
#' \item{MODULE_NAME_FR}{}
#' \item{GROUP_DESC}{}
#' \item{GROUP_DESC_FR}{}
#' \item{EST_CA_QUESTION_ID}{}
#' \item{PARENT_QUESTION_CODE}{}
#' \item{PARENT_QUESTION_ID}{}
#' \item{QUESTION_CODE_ID}{}
#' \item{UPDATED_DATE}{}
#' \item{CREATED_DATE}{}
#' \item{EST_CA_DATA_TYPE_NAME}{}
#' \item{QUESTION_EN}{}
#' \item{QUESTION_FR}{}
#' \item{QUESTION_DESC_EN}{}
#' \item{QUESTION_DESC_FR}{}
#' \item{TOOLTIP_EN}{}
#' \item{TOOLTIP_FR}{}
#' }
#' @examples
#'   ca_doc
"ca_doc"
