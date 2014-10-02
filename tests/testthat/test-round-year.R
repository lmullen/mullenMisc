context("Round years")

year <- 1984
set_of_years <- seq(1892, 1923, 4)

test_that("the returned years are correctly rounded", {
  expect_that(round_year(year, round_to = "decade"), equals(1980))
  expect_that(round_year(year, round_to = "century"), equals(1900))
  expect_that(round_year(set_of_years, round_to = "decade"),
              equals(c(1890, 1890, 1900, 1900, 1900, 1910, 1910, 1920)))
  expect_that(round_year(set_of_years, round_to = "century"),
              equals(c(1800, 1800, 1900, 1900, 1900, 1900, 1900, 1900)))
})
