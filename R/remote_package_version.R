#' Check remote package version
#'
#' Check the version of a package available in a CRAN-style repository.
#'
#' @param pkg A character vector of package names.
#' @param repos A character vector of CRAN-style repositories to check.
#' @details This function does not use any of the filters that are used by
#'   \code{available.packages} to return only packages that are suitable for a
#'   particular machine without duplicates. It should show the versions
#'   available in all package repositories for all architectures.
#' @return A data frame of package names, versions, and repositories.
#' @examples
#' remote_package_version(c("stringr"))
#' @export
remote_package_version <- function(pkg,  repos = getOption("repos")) {
  if (missing(pkg)) stop("Please specify which packages to check")
  if (repos["CRAN"] == "@CRAN@") repos["CRAN"] <- "https://cran.rstudio.com"
  packages <- utils::available.packages(contriburl = contrib.url(repos),
                                        type = "both",
                                        filters = list())
  packages <- as.data.frame(packages)
  results  <- packages[packages$Package %in% pkg,
                  c("Package", "Version", "Repository")]
  row.names(results) <- NULL
  results$Repository <- gsub("/src/contrib", "", results$Repository)
  results
}
