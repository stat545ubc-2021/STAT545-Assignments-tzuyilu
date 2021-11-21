test_that("OutputSum outputs data in a class of data frame", {
  testthat::expect_true(is.data.frame(OutputSum(vancouver_trees,"species_name","diameter")))
})
