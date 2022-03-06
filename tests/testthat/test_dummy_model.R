setwd("/workdir")
library(tidyverse)

dataset <- tibble(id = 1:2, target = 3:4)
# Lee train.csv
describe("Read training dataset", {
  it("reads all 1304 records", {
    training_dataset <- read_training_dataset()
    obtained_n_rows <- nrow(training_dataset)
    expected_n_rows <- 1304
    expect_equal(expected_n_rows, obtained_n_rows)
  })
})


# Calcula promedio de target
describe("Get target mean", {
  it("calculate mean of two numbers", {
    obtained_mean <- get_target_mean(dataset)
    expected_mean <- 3.5
    expect_equal(expected_mean, obtained_mean)
  })
})


# Lee test.csv
describe("Read testing dataset", {
  it("reads all 326 records", {
    testing_dataset <- read_testing_dataset()
    obtained_n_rows <- nrow(testing_dataset)
    expected_n_rows <- 326
    expect_equal(expected_n_rows, obtained_n_rows)
  })
})


# Tira todas las columnas excepto id
describe("Drop all columns except id", {
  it("has only one column and it is named id", {
    dataset_only_id <- drop_all_but_id(dataset)
    obtained_columns <- colnames(dataset_only_id)
    expected_columns <- "id"
    expect_equal(expected_columns, obtained_columns)
  })
})


# Agrega columna target con el promedio
describe("Add mean as target", {
  it("contains the mean on each row of the target", {
    submission_with_mean_as_target <- add_mean_as_target()
    obtained_target <- submission_with_mean_as_target$target[2]
    expected_target <- 34.67101226993865
    expect_equal(expected_target, obtained_target)
  })
})


# Guarda el archivo con sufijo _submission.csv
describe("Write submission", {
  it("writes a csv file", {
    submission_path <- "pollos_petrel/example_r_submission.csv"
    if (file.exists(submission_path)) {
      file.remove(submission_path)
    }
    expect_false(file.exists(submission_path))
    write_submission()
    expect_true(file.exists(submission_path))
    file.remove(submission_path)
  })
})
