#' Parse an NHGIS codebook
#'
#' \href{http://nhgis.org}{NHGIS} provides historical census data with fields
#' named, for example AA001. For each csv file it provides a plain text codebook
#' which explains the meanings of these codes. This function parses those
#' codebooks and returns a data frame which can be merged back into the dataset
#' to get the meanings of the codes.
#'
#' @param filename The path to an NHGIS codebook.
#' @export
#' @return A data frame with two columns \code{code} and \code{meaning}.
#' @examples
#' sample_codebook <- system.file("extdata",
#'                                "nhgis0024_ds17_1870_county_codebook.txt",
#'                                package = "mullenMisc")
#' parse_nhgis_codebook(sample_codebook)
parse_nhgis_codebook <- function(filename) {
  scan(file = filename, what = "character", sep = "\n", quiet = TRUE) %>%
    stringi::stri_extract_first_regex("([A-Z]{2,4}\\d{2,5}): {6}(\\w.+)$") %>%
    na.omit() %>%
    stringi::stri_split_fixed(":      ") %>%
    do.call(rbind.data.frame, .) %>%
    dplyr::select(code = 1, meaning = 2)
}

# Hide variables from R CMD check
if(getRversion() >= "2.15.1") {
  utils::globalVariables(".")
}
