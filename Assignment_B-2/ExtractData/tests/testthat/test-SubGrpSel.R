test_that("SubGrpSel outputs data in a class of data frame", {
  testthat::expect_true(is.data.frame(SubGrpSel(vancouver_trees,"neighbourhood_name","KITSILANO")))
})


test_that("SubGrpSel chooses regions correctly", {
  TR <- SubGrpSel(vancouver_trees,"neighbourhood_name",c("ARBUTUS-RIDGE","DUNBAR-SOUTHLANDS"))
  testthat::expect_equal(unique(TR$neighbourhood_name), c("ARBUTUS-RIDGE","DUNBAR-SOUTHLANDS"))
})

