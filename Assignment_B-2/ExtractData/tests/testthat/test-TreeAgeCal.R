test_that("Check no NAs and column class in the TreeAgeCal function.", {
  expect_equal(is.na(VanTreeUBC$tree_age), rep(FALSE,length(VanTreeUBC$tree_age)))
  expect_true(is.numeric(VanTreeUBC$tree_age))
})
