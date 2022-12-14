% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/au_palette.R
\name{au_palette}
\alias{au_palette}
\title{Analytics Unit Colour Schemes}
\usage{
au_palette(colour, palette = TRUE)
}
\arguments{
\item{colour}{the name of the colour you want the hex code of; you will get a palette when missing}

\item{palette}{the name of palette you want to use: "au" or "ops". You will get all the colours in both palettes when this argument is set to be "TRUE"}
}
\value{
hex-code(s) of colours included in the AU or OPS palettes
}
\description{
A function that provides either a colour palette or a hex code of colours that are recommended by
\href{https://intra.ontario.ca/tbs/ontario-logo}{OPS} and are commonly used in the analytics units.
}
\details{
The colours included in the \code{au} palette: \code{maroon}, \code{drk_grn}, \code{teal}, \code{blue}, \code{lt_blue}, and \code{gold},
The colours in the \code{ops} palette: \code{mustard}, \code{yellow}, \code{beige}, \code{green}, \code{red}, \code{lt_green}, \code{purple}, \code{orange},
and \code{hot_pink}

If you do not provide the name of the palette, it will give you all the colours in both \code{au} and \code{ops} palettes
}
\examples{

library(ggplot2, warn.conflicts = FALSE)
data.frame(x = rnorm(n = 60),
           y = rnorm(n = 60),
           w = as.factor(rep(LETTERS[1:6], times = 10))) \%>\%
ggplot(aes(x = x,
           y = y,
           colour = w)) +
geom_point() +
scale_color_manual(values = au_palette(palette = "au")) +
theme_minimal()

# To use the AU palette with colours in both "au" and "ops" palettes
au_palette()

# To use the OPS palette with colours that are recommended by OPS
au_palette(palette = "ops")

# To use the AU palette with colours that are commonly used in AU
au_palette(palette = "au")

# To find the hex code of a specific colour
au_palette(colour = c("maroon", "blue"))

}
