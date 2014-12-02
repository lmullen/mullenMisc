#' Lookup a key in a table and return a value
#'
#' A common problem is to look up some key and return a value for it. This
#' function lets you provide a vector of keys to lookup and a table (either a
#' data frame or a named vector) with keys and values. If the lookup table is a
#' data frame, you can specify which columns of the table contain the keys and
#' the values: the default is to look for the keys in column 1 and the values in
#' column 2. If the lookup table is a named vector, then the names are the keys
#' and the vector values are the lookup values.
#'
#' @param x The keys to lookup
#' @param lookup_table The table of keys and values, either as a data frame with
#'   a key column and a value column, or a named vector.
#' @param key The index or name of the column with the keys
#' @param value The index or name of the column with the values
#' @examples
#' my_table <- data.frame(letters = letters[1:5],
#'                        colors = c("red", "green", "blue", "pink", "orange"),
#'                        stringsAsFactors = FALSE)
#' lookup(c("a", "e", "c"), my_table)
#' lookup(c("green", "blue"), my_table, key = "colors", value = "letters")
#'
#' my_vector <- c("a" = "red", "b" = "green", "c" = "blue", "d" = "pink")
#' lookup(c("a", "d", "c"), my_vector)
#' @export
lookup  <- function(x, lookup_table, key = 1, value = 2) {
  if(is.data.frame(lookup_table)) {
    ind <-  which(x == lookup_table[ , key])
    if(length(ind) == 0) return(NA) # check for missing/NA values
    val <- lookup_table[ind, value]
    unlist(val, use.names = FALSE)
  } else {
    val <- lookup_table[which(x == names(lookup_table))]
    if(length(val) == 0) return(NA) else return(unname(val))
  }
}
lookup <- Vectorize(lookup, vectorize.args = "x", USE.NAMES = FALSE)
