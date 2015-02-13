#' Cache the result of a block of code to disk
#'
#' When loading large amounts of data or performing a long running computation,
#' it is ofen desirable to cache the results. This function assumes that you
#' wish to run a block of code, assigning the resulting value to a variable.
#' That value will then be cached to disk, and the second time that the code is
#' run, the value will be read from disk.
#'
#' Caveats: Caching a value is only worthwhile if the roundtrip to disk is less
#' expensive than the computation itself. Only the last value in the block of
#' code will be cached. (That last value can include assignment.)
#'
#' @param file The path to a file in which the results should be cached. It is
#'   preferred that the file name should end in \code{.rds} to indicate that it
#'   is a serialized R object. Cf. \link{saveRDS}.
#' @param expr A block of code delimited by braces \code{\{\}}.
#' @return The last value computed in \code{expr}.
#' @examples
#' # On the first run, the value is computed and cached to disk
#' f <- tempfile(fileext = ".rds")
#' a <- cache(f, {
#'       Sys.sleep(2)
#'       z <- 10
#'      })
#' a # 10
#' z # 10
#' rm(z)
#'
#' # On the second run, the value is retrieved from disk
#' b <- cache(f, {
#'       Sys.sleep(2)
#'       z <- 10
#'      })
#'
#' identical(a, b) # The value from disk is the same as the last computed value
#' exists("z")     # The block of code was not executed
#'
#' @export
cache <- function(file, expr) {
  if (file.exists(file)) {
    message("Reading cached object from ", file)
    readRDS(file)
  } else {
    message("Computing object and caching to ", file)
    x <- expr
    saveRDS(x, file = file)
    x
  }
}
