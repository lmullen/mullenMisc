context("Lookup")

t <- data_frame(letters = letters[1:5],
                colors = c("red", "blue", "green", "orange", "yellow"),
                numbers = 1:5)

d1 <- c("a", "e", "b", "d", "c", "z", NA)
results1 <- lookup(d1, t)
correct1 <- c("red", "yellow", "blue", "orange", "green", NA, NA)

results2 <- lookup(d1, t, key = "letters", value = "numbers")
correct2 <- c(1, 5, 2, 4, 3, NA, NA)

d3 <- c("red", "yellow", "blue", "orange", "green", "chartruese", NA)
results3 <- lookup(d3, t, key = "colors", value = "letters")
correct3 <- c("a", "e", "b", "d", "c", NA, NA)

test_that("results are a vector of the correct type", {
  expect_is(results1, "character")
  expect_is(results2, "integer")
  expect_is(results3, "character")
})

test_that("lookup works with data frame in both directions", {
  expect_equal(results1, correct1)
  expect_equal(results2, correct2)
  expect_equal(results3, correct3)
})
