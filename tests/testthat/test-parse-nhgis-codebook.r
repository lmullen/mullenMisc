context("Parse NHGIS codebook")


codebook1 <- parse_nhgis_codebook(
  system.file("extdata", "ds10_1850_state_codebook.txt",
              package = "mullenMisc"))

codebook2 <- parse_nhgis_codebook(
  system.file("extdata", "nhgis0024_ds17_1870_county_codebook.txt",
              package = "mullenMisc"))

test_that("a data frame is returned", {
  expect_that("data.frame" %in% class(codebook1), equals(TRUE))
  expect_that("data.frame" %in% class(codebook2), equals(TRUE))
})

test_that("the data frame has two properly named columns", {
  expect_that(colnames(codebook1), equals(c("code", "meaning")))
  expect_that(colnames(codebook2), equals(c("code", "meaning")))
})
