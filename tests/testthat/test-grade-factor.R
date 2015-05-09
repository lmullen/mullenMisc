context("Grade factors")

test_that("converts character vector to a factor", {
  g <- c("A+", "C-", NA, "B", "F")
  f <- grade_factor(g)
  expect_is(f, "factor")
  expect_true(is.ordered(f))
})

test_that("does not accept invalid grade values", {
  g <- c("A+", "G", "fake value")
  expect_error(grade_factor(g))
})
