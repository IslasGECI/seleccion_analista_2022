library(covr)
library(testthat)
cobertura <- file_coverage(
  c(
    "R/do_nothing.R"
  ),
  c(
    "tests/testthat/test_nothing.R"
  )
)
covr::codecov(covertura = cobertura, token = "f1c20322-d682-4c6c-886b-4d3c3802a21e")
