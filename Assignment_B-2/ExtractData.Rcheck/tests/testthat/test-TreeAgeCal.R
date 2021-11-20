TR <- TreeAgeCal(vancouver_trees, "2021-11-20") # test result

test_that("TreeAgeCal drops NA values correctly", {
  testthat::expect_equal(is.na(TR$tree_age), rep(FALSE,length(TR$tree_age)))
})

test_that("TreeAgeCal outputs data in correct format", {
  testthat::expect_true(is.numeric(TR$tree_age))
})
