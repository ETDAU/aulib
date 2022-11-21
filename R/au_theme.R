#' AU's ggplot theme
#'
#' @importFrom ggplot2 '%+replace%' element_text element_blank
#'
#' @return a ggplot theme for the AU
#' @export
#'
#'
#' @example inst/examples/ex-theme_au_minimal.R
au_minimal_theme = function() {


  ggplot2::theme_minimal() %+replace%

  ggplot2::theme(

    # titles
    plot.title = element_text(size = 16,
                              face = "bold",
                              hjust = 0),        # left aligned

    plot.subtitle = element_text(size = 14,
                                 hjust = 0),

    axis.text = element_text(size = 12),

    axis.title = element_text(size = 13,
                              vjust = -1),

    # grid lines
    panel.grid = element_blank(),
    panel.grid.minor = element_blank(),

    # legend
    legend.position = "top",
    legend.text = element_text(size = 12),

    # facet wrap
    strip.text.x = element_text(size = 12),
    strip.text.y = element_text(size = 12),
    strip.background = element_rect("grey")

  )
}
