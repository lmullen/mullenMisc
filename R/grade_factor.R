#' Convert grades to a factor with ordered levels
#'
#' Convert a character vector of grades to an ordered factor. This function
#' checks that the grade values are appropriate. It does accept \code{NA}. This
#' function is useful when plotting grades.
#'
#' @param x A character vector of grades, e.g., \code{c("A+", "F", NA)}
#' @return An ordered factor
#' @examples
#' g <- c("A-", "F", NA, "C+", "B+")
#' grade_factor(g)
#' @export
grade_factor <- function(x) {
  l <- c("A+", "A", "A-",
         "B+", "B", "B-",
         "C+", "C", "C-",
         "D+", "D", "D-",
         "F", NA)

  # Check that all grades are valid
  assert_that(!any(!is.element(x, l)))

  factor(x, levels = l, ordered = TRUE)
}
