context("Course grades")

grades <- data_frame(names = c("Anna", "Bill"),
                     email = c("a@@uni.edu", "b@@uni.edu"),
                     paper = c("A-", "B"),
                     essay = c("D", "C+"))

w1 <- c("paper" = 0.8, "essay" = 0.2)
w2 <- c("paper" = 0.2, "essay" = 0.8)

c1 <- data_frame(names = c("Anna", "Bill"),
                 total = c((3.67 * .8) + (1    * 0.2),
                           (3    * .8) + (2.33 * 0.2)),
                 total_letter = c("B", "B"))

c2 <- data_frame(names = c("Anna", "Bill"),
                 total = c((3.67 * .2) + (1    * 0.8),
                           (3    * .2) + (2.33 * 0.8)),
                 total_letter = c("C-", "C+"))

test_that("Course grades are calculated correctly on a four-point scale", {
  expect_equivalent(course_grades(grades, w1, method = "fourpt"), c1)
  expect_equivalent(course_grades(grades, w2, method = "fourpt"), c2)
})
