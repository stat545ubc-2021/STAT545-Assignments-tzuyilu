test_that("Check no NAs and column class in the TreeAgeCal function.", {
  testthat::expect_equal(is.na(input_data$tree_age), rep(FALSE,length(input_data$tree_age)))
  testthat::expect_true(is.numeric(input_data$tree_age))
})
