#' Print a dot during repeated executions of a function
#'
#' @param n Number of iterations between dots
#' @param f The function to be called
#' @references This function is borrowed from Hadley Wickham, \emph{Advanced R}
#' (Chapman and Hall, 2014),
#' \href{http://adv-r.had.co.nz/Function-operators.html}{section 12.1}.
#' @return A version of function \code{f} that prints dots.
#' @examples
#' f <- dot_every(5, sqrt)
#' r <- lapply(1:100, f)
#' @export
dot_every <- function(n = 10, f) {
  i <- 1
  function(...) {
    if (i %% n == 0) cat(".")
    i <<- i + 1
    f(...)
  }
}
