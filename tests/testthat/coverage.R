library(covr)
library(testthat)
cobertura <- file_coverage(
  c(
    "R/do_nothing.R",
    "R/dummy_model.R"
  ),
  c(
    "tests/testthat/test_nothing.R",
    "tests/testthat/test_dummy_model.R"
  )
)
covr::codecov(covertura = cobertura, token = "f1c20322-d682-4c6c-886b-4d3c3802a21e")
