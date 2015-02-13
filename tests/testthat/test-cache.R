context("Cache")

f <- tempfile(fileext = ".rds")

test_that("The value is computed the first time and cached the second", {
  expect_that(val1 <- cache(f, {Sys.sleep(1); z <- 10}),
              shows_message("Computing object"))
  expect_that(val2 <- cache(f, {Sys.sleep(1); z <- 10}),
              shows_message("Reading cached object"))
  expect_that(suppressMessages(val3 <- cache(f, {Sys.sleep(1); z <- 10})),
              takes_less_than(1))
  expect_identical(val1, val2)
  expect_identical(val1, z)
  expect_identical(val2, z)
})
