TR <- OutputSum(vancouver_trees,"species_name","tree_age") # test result

test_that("OutputSum outputs data in correct format", {
  testthat::expect_true(is.numeric(TR$tree_age))
})