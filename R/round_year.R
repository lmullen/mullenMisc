#' Round years to decades or centuries
#'
#' This function takes a year as a numeric value and rounds it to the nearest
#' decade or century.
#'
#' @param year Year to test (as a number)
#' @param round_to Round the year to either the \code{decade} or \code{century}.
#' @return The rounded year as an integer.
#' @examples
#' set_of_years <- seq(1892, 1923, 4)
#' round_year(set_of_years) # round to decade by default
#' round_year(set_of_years, round_to = "century")
#' @export
round_year <- function(year, round_to = "decade") {
  assert_that(is.numeric(year))
  assert_that(round_to %in% c("decade", "century"))
  if(round_to == "decade") {
    round_val <- 10
  } else if(round_to == "century") {
    round_val <- 100
  }
  as.integer(trunc(year / round_val) * round_val)
}
