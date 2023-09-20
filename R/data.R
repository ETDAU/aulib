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
#' \item{MODULE_SEQUENCE}{The order in which modules in CA appear}
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

#' Geographical reference table
#'
#' Reference table for mapping `geo_uid` from StatCan data to EST catchment areas and economic regions
#' @format ## `geo_ref`
#' A table with 16 rows and 4 columns:
#' \describe{
#'  \item{catchment_id}{Catchment ID}
#'  \item{catchment_area}{EST catchment area name}
#'  \item{geo_uid}{StatCan's geographical region ID}
#'  \item{economic_region}{Economic region}
#' }
#' @source Analytics Unit > Projects > EST > Catchment Areas > 2021 Provincial Rollout > Geo_Reference.xlsx
"geo_ref"

#' NOC 2021 Table
#'
#' Translation table for 2021 NOC codes created by @mpane
#'
#' @format A data frame with x rows and y column(s)
#' \describe{
#'   \item{NOC_CODE}{A 5-digit NOC code associated with an occupation}
#'   \item{NOC}{Job title}
#'   \item{NOC_1_DIGIT}{1st digit of NOC code}
#'   \item{BROAD_CATEGORY}{The Broad Category (first digit) of the classification represents the occupational categorization which is defined by the type of work performed, the field of study, or the industry of employment. There are 10 Broad categories in NOC 2021 Version 1.0.}
#'   \item{NOC_2_DIGIT}{First two digits of NOC code}
#'   \item{MAJOR_GROUP}{The Major Group (first and second digits) of the classification is represented by the Broad occupational categorization (first digit) and TEER categorization (second digit) together. A major group also encompasses several sub-major groups and thus represents the two-digit code used by the NOC. There are 45 major groups in NOC 2021 Version 1.0.}
#'   \item{NOC_3_DIGIT}{First three digits of NOC code}
#'   \item{SUB_MAJOR_GROUP}{The Sub-major Group (3-digit) of the classification represents the aggregation of several minor groups and thus represents the three-digit code used by the NOC. There are 89 sub-major groups in NOC 2021 Version 1.0.}
#'   \item{NOC_4_DIGIT}{First four digits of NOC code}
#'   \item{MINOR_GROUP}{The Minor Group (4-digit) of the classification represents the domain in which an occupation is carried out (occupational domain). It is an aggregation of several unit groups and thus represents the four-digit code used by the NOC. There are 162 minor groups in NOC 2021 Version 1.0.}
#'   \item{NOC_TEER}{Second-digit of all codes}
#'   \item{TEER_CATEGORY}{The TEER Category (second digit) of the classification represents the necessary training, education, experience and responsibilities of the occupation. There are 6 TEER categories in NOC 2021 Version 1.0.}
#'   \item{TEER_DESCRIPTION}{The degree of Training, Education, Experience and Responsibilities.}
#' }
#' @source \url{https://github.com/ETDAU/trf-analysis/blob/8ea37620771743fa7b05561e4dd268bd8cec6e34/NOC_NAICS_Processing_Srcript.Rmd/"}
"noc_2021"
