library(tidyverse)

read_training_dataset <- function() {
  training_dataset_path <- "pollos_petrel/train.csv"
  training_dataset <- read_csv(training_dataset_path)
  return(training_dataset)
}


get_target_mean <- function(dataset) {
  mean_target <- mean(dataset$target)
  return(mean_target)
}


read_testing_dataset <- function() {
  testing_dataset_path <- "pollos_petrel/test.csv"
  testing_dataset <- read_csv(testing_dataset_path)
  return(testing_dataset)
}


drop_all_but_id <- function(dataset) {
  dataset_only_id <- dataset["id"]
  return(dataset_only_id)
}
