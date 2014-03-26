#' Save a ggplot to multiple formats
#' 
#' This function saves a ggplot object to multiple formats in the same
#' dimensions with similar filenames. By default it saves to SVG, PDF, 
#' and PNG.
#' 
#' @param plot The ggplot object to save
#' @param filename The file name without the extension
#' @param formats A character vector of formats to save
#' @param width The width in the same units that \code{ggsave} uses.
#' @param height The height in the same units that \code{ggsave} uses.
#' @export
#' @examples
#' require(ggplot2)
#' plot <- qplot(mpg, wt, data = mtcars)
#' fig_save(plot)
fig_save <- function(plot, filename = "plot",
                     formats = c("svg", "pdf", "png"),
                     width = 11, height = 8.5) {
  require(ggplot2)
  for (format in formats) {
    ggsave(plot = plot, filename = paste(filename, format, sep = "."),
           width = width, height = height)
  }
}