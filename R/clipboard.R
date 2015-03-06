#' Copy R objects to the clipboard
#'
#' @param x The object to be written
#' @examples
#' clipboard("Hello, clipboard")
#' clipboard(mtcars)
#' @export
clipboard <- function(x) UseMethod("clipboard")

#' @export
clipboard.default <- function(x) {
  cb <- pipe("pbcopy", "w")
  writeLines(x, cb)
  close(cb)
}

#' @export
clipboard.data.frame <- function(x) {
  cb <- pipe("pbcopy", "w")
  write.csv(x, cb, row.names = FALSE, na = "")
  close(cb)
}
