TR1 <- TmeDifCal(vancouver_trees, "date_planted", "2021-11-20","tree_age") # test result

test_that("TmeDifCal drops NA values correctly", {
  testthat::expect_equal(is.na(TR1$tree_age), rep(FALSE,length(TR1$tree_age)))
})

test_that("TmeDifCal outputs data in correct format", {
  testthat::expect_true(is.numeric(TR1$tree_age))
})

# ----------

TR2 <- TmeDifCal(vancouver_trees, "date_planted", "2021-11-20","passed_time")
test_that("TmeDifCall creates a new column as specified", {
  testthat::expect_false(is.na(match("passed_time",names(TR2))))
})
