#' Add an attribution to a plot that can be saved with ggsave()
#'
#' This function adds an attribution label to a plot. You can customize the
#' text and appearance of the label.
#'
#' @param plot The ggplot object to which the attribution should be added
#' @param text Label text
#' @param size Size of the label text
#' @param color Color of the label text
#' @export
#' @examples
#' \dontrun{
#' require(ggplot2)
#' plot <- qplot(mpg, wt, data = mtcars)
#' plot_attributed <- gg_attribution(plot, "Your attribution")
#' print(plot_attributed)
#' }
gg_attribution <- function(plot,
                           text = "Lincoln Mullen <http://lincolnmullen.com>",
                           size = 0.75, color = "gray10") {
  gridExtra::arrangeGrob(plot,
              sub = textGrob(text,
                             x = unit(1, "npc") - unit(2, "mm"),
                             y = unit(2, "mm"),
                             just = c("right", "bottom"),
                             gp = gpar(cex = size, col = color)))
}
