
#' Analytics Unit Colour Schemes
#'
#' A function that provides either a colour palette or a hex code of colours that are recommended by
#' [OPS](https://intra.ontario.ca/tbs/ontario-logo) and are commonly used in the analytics units.
#'
#' The colours included in the `au` palette: `maroon`, `drk_grn`, `teal`, `blue`, `lt_blue`, and `gold`,
#' The colours in the `ops` palette: `mustard`, `yellow`, `beige`, `green`, `red`, `lt_green`, `purple`, `orange`,
#' and `hot_pink`
#'
#' If you do not provide the name of the palette, it will give you all the colours in both `au` and `ops` palettes
#'
#'
#' @param colour the name of the colour you want the hex code of; you will get a palette when missing
#' @param palette the name of palette you want to use: "au" or "ops". You will get all the colours in both palettes when this argument is set to be "TRUE"
#'
#' @return hex-code(s) of colours included in the AU or OPS palettes
#' @export
#'
#' @importFrom ggplot2 ggplot aes geom_point scale_color_manual theme_minimal
#'
#' @examples
#'
#' library(ggplot2, warn.conflicts = FALSE)
#' data.frame(x = rnorm(n = 60),
#'            y = rnorm(n = 60),
#'            w = as.factor(rep(LETTERS[1:6], times = 10))) %>%
#' ggplot(aes(x = x,
#'            y = y,
#'            colour = w)) +
#' geom_point() +
#' scale_color_manual(values = au_palette(palette = "au")) +
#' theme_minimal()
#'
#' # To use the AU palette with colours in both "au" and "ops" palettes
#' au_palette()
#'
#' # To use the OPS palette with colours that are recommended by OPS
#' au_palette(palette = "ops")
#'
#' # To use the AU palette with colours that are commonly used in AU
#' au_palette(palette = "au")
#'
#' # To find the hex code of a specific colour
#' au_palette(colour = c("maroon", "blue"))
#'

au_palette = function(colour, palette = TRUE) {

  # create a table with the colour and their hex-codes ------
  colour_ref = data.frame(colour_name = c("blue", "maroon", "teal", "drk_grn", "lt_blue", "gold",
                                          "mustard", "yellow", "beige", "green", "red", "lt_green",
                                          "purple", "orange", "hot_pink"),
                          hex = c("#047cc2", "#8f103c", "#47A6A1", "#035951", "#77c1ed", "#8f6310",
                                  "#cda62f", "#fdaf17", "#c2b290", "#37b54a", "#ed1b24", "#8dc641",
                                  "#912690", "#f15a23", "#ed037e"))

  # conditional statement for the argument specificatoin ----
  if( missing(colour) & palette == TRUE) {

    colour = colour_ref$hex

  } else if( missing(colour) & palette == "ops"){

    colour = colour_ref$hex[7:15]

  } else if( missing(colour) & palette == "au") {

    colour = colour_ref$hex[1:6]

  } else if( missing(palette) ) {

    colour = colour_ref[colour_ref$colour_name %in% colour, "hex"]

  }

  return(colour)
}
