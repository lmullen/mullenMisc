#' Delay the execution of a function
#'
#' @param delay The delay in seconds
#' @param f The function to be called
#' @references This function is borrowed from Hadley Wickham, \emph{Advanced R}
#' (Chapman and Hall, 2014),
#' \href{http://adv-r.had.co.nz/Function-operators.html}{section 12.1}.
#' @return A delayed version of function \code{f}.
#' @examples
#' f <- delay_by(1, sqrt)
#' sapply(1:5, f)
#' @export
delay_by <- function(delay = 1, f) {
  function(...) {
    Sys.sleep(delay)
    f(...)
  }
}
