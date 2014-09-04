#' Check that a course title is under the maximum length
#'
#' George Mason University only allows course names with a maximum of thirty
#' characters.
#' @param title The character vector for the title
#' @return TRUE for a course within the maximum length; FALSE otherwise.
#' @export
#' @examples
#' course_title_length_ok("Church and State in America")
course_title_length_ok <- function(title) {
  max_length <- 30
  nchar(title) <= max_length
}
