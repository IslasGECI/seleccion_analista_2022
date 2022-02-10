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
# Agrega columna target con el promedio
# Guarda el archivo con sufijo _submission.csv
