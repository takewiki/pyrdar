test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})


data = mysql_select()

data[[1]]

lapply(data[[1]], class)
