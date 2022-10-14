#' AU's ggplot theme
#'
#'
#' @return a ggplot theme for the AU
#' @export
#'
#'
#' @examples inst/examples/ex-theme_au_minimal.R
au_minimal_theme = function() {


  ggplot2::theme_minimal() %+replace%

  ggplot2::theme(

    # title
    plot.title = element_text(size = rel(1.5),
                              face = "bold",
                              hjust = 0),        # left aligned

    plot.subtitle = element_text(size = rel(1.25)),


    axis.text = element_text(size = rel(1)),

    axis.title = element_text(size = rel(1.1),

                              vjust = -1),

    panel.grid = element_blank(),
    panel.grid.minor = element_blank(),

    legend.position = "top",
    legend.title = element_blank()

  )
}
