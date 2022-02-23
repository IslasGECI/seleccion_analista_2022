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
covr::codecov(coverage = cobertura, token = "ad0d0063-7fec-4b66-8c6b-17045b746776")
