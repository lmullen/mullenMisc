#' Calculate course grades
#'
#' Given a data frame of assignments and a vector of assignment weights,
#' calculate course grades using a four-point grading scale.
#'
#' @param grades A data frame of assignment grades. The first column should be
#'   the students' names. Letter grades should be entered in columns named after
#'   the assignment. The data frame may contain other columns that will not be
#'   used the in the calculation of grades. Strings must not be factors.
#' @param weights A named vector of the weights for each assignment. The names
#'   should be identical to the names of the columns used for assignments in the
#'   \code{grades} data frame. The weights must sum to \code{1}.
#'
#' @return A data frame of names, numeric, and letter grades.
#'
#' @seealso \code{\link{grades_4pt}}
#'
#' @examples
#' assignments <-  data.frame(names = c("Anna", "Bill", "Cara", "Dan"),
#'                            essay = c("B", "A", "D", "C"),
#'                            paper = c("A-", "B+", "C", "A"),
#'                            exam  = c("B-", "C+", "D", "A-"),
#'                            email = c("a@@uni.edu", "b@@uni.edu",
#'                             "c@@uni.edu", "d@@uni.edu"),
#'                             stringsAsFactors = FALSE)
#' weights <- c("essay" = 0.2, "paper" = 0.5, "exam" = 0.3)
#' course_grades(assignments, weights)
#' @export
course_grades <- function(grades, weights) {

  assert_that(sum(weights) == 1.0)

  grades <- grades[c(names(grades)[1], names(weights))]

  for(col in names(weights)) {
    grades[[col]]  <- lookup(grades[[col]],
                             grades_4pt) * weights[col]
  }

  grades$total <- rowSums(grades[,-1])
  grades <- grades[c(1, ncol(grades))]

  for(i in seq_len(nrow(grades))) {
    grades$total_letter[i] <-
      (grades$total[i] >= grades_4pt$lowest) %>%
          which() %>%
          max() %>%
          grades_4pt$grade[.]
  }

  grades

}
