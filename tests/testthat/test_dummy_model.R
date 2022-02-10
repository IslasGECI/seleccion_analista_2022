setwd("/workdir")

# Lee train.csv
describe("Read training dataset", {
  it("reads all 1304 records", {
    training_dataset <- read_training_dataset()
    obtained_n_rows <- dim(training_dataset)[1]
    expected_n_rows <- 1304
    expect_equal(expected_n_rows, obtained_n_rows)
  })
})


# Calcula promedio de target
describe("Get target mean", {
  it("calculate mean of two numbers", {
    dataset <- tibble(id = 1:2, target = 3:4)
    obtained_mean <- get_target_mean(dataset)
    expected_mean <- 3.5
    expect_equal(expected_mean, obtained_mean)
  })
})


# Lee test.csv
describe("Read testing dataset", {
  it("reads all 326 records", {
    testing_dataset <- read_testing_dataset()
    obtained_n_rows <- dim(testing_dataset)[1]
    expected_n_rows <- 326
    expect_equal(expected_n_rows, obtained_n_rows)
  })
})


# Tira todas las columnas excepto id
describe("Drop all columns except id", {
  it("has only one column and is named id", {
    dataset <- tibble(id = 1:2, target = 3:4)
    dataset_only_id <- drop_all_but_id(dataset)
    obtained_columns <- colnames(dataset_only_id)
    expected_columns <- "id"
    expect_equal(expected_columns, obtained_columns)
  })
})


# Agrega columna target con el promedio
# Guarda el archivo con sufijo _submission.csv
