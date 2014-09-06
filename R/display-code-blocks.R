#' Set whether or not to display knitr code blocks and output in a document
#'
#' The value passed to this function determines whether or not to display code
#' blocks, their warnings, and their results in a Knitr document.
#' @param display TRUE to display the code blocks; false to hide them
#' @export
display_code_blocks <- function(display = TRUE) {
  # See http://yihui.name/knitr/options
  results_flag  <- ifelse(display, "markup", "hide")
  knitr::opts_chunk$set(echo = display,
                        warning = display,
                        message = display,
                        results = results_flag)
}
