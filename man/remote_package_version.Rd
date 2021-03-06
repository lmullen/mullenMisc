% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/remote_package_version.R
\name{remote_package_version}
\alias{remote_package_version}
\title{Check remote package version}
\usage{
remote_package_version(pkg, repos = getOption("repos"))
}
\arguments{
\item{pkg}{A character vector of package names.}

\item{repos}{A character vector of CRAN-style repositories to check.}
}
\value{
A data frame of package names, versions, and repositories.
}
\description{
Check the version of a package available in a CRAN-style repository.
}
\details{
This function does not use any of the filters that are used by
  \code{available.packages} to return only packages that are suitable for a
  particular machine without duplicates. It should show the versions
  available in all package repositories for all architectures.
}
\examples{
remote_package_version(c("stringr"))
}

