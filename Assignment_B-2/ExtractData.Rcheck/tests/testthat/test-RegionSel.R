test_that("RegionSel outputs data in a class of data frame", {
  testthat::expect_true(is.data.frame(RegionSel(vancouver_trees,"KITSILANO")))
})


test_that("RegionSel chooses regions correctly", {
  TR <- RegionSel(vancouver_trees,c("ARBUTUS-RIDGE","DUNBAR-SOUTHLANDS"))
  testthat::expect_equal(unique(TR$neighbourhood_name), c("ARBUTUS-RIDGE","DUNBAR-SOUTHLANDS"))
})

