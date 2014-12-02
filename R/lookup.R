#' Lookup a key in a table and return a value
#'
#' A common problem is to look up some key and return a value for it. This
#' function lets you provide a vector of keys to lookup and a table (usually a
#' data frame) with keys and values. Optionally, it lets you specify which
#' columns of the table contain the keys and the values: the default is to look
#' for the keys in column 1 and the values in column 2.
#'
#' @param x The keys to lookup
#' @param lookup_table The table of keys and values
#' @param key The index or name of the column with the keys
#' @param value The index or name of the column with the values
#' @examples
#' my_table <- data.frame(letters = letters[1:5],
#'                        colors = c("red", "green", "blue", "pink", "orange"),
#'                        stringsAsFactors = FALSE)
#' lookup(c("a", "e", "c"), my_table)
#' lookup(c("green", "blue"), my_table, key = "colors", value = "letters")
#' @export
lookup  <- function(x, lookup_table, key = 1, value = 2) {
  ind <-  which(x == lookup_table[ , key])
  if(length(ind) == 0) return(NA) # check for missing/NA values
  val <- lookup_table[ind, value]
  unlist(val, use.names = FALSE)
}
lookup <- Vectorize(lookup, vectorize.args = "x", USE.NAMES = FALSE)
