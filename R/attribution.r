#' Add an attribution label to a plot
#'
#' This function adds an attribution label to a plot. You can customize the
#' text and appearance of the label. This function is adapted from Kieran
#' Healy's code.
#'
#' @param text label text
#' @param size size of the label text
#' @param color color of the label text
#' @export
#' @examples
#' plot(faithful)
#' attribution()
attribution <- function(text = "Lincoln Mullen <http://lincolnmullen.com>",
                        size = 0.75, color = "gray10") {
  pushViewport(viewport())
  grid.text(label = text ,
            x = unit(1, "npc") - unit(2, "mm"),
            y = unit(2, "mm"),
            just = c("right", "bottom"),
            gp = gpar(cex = size, col = color))
  popViewport()
}
