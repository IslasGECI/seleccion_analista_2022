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
  dataset_only_id <- dataset %>% select("id")
  return(dataset_only_id)
}


add_mean_as_target <- function() {
  training_dataset <- read_training_dataset()
  target_mean <- get_target_mean(training_dataset)
  testing_dataset <- read_testing_dataset()
  submission <- drop_all_but_id(testing_dataset) %>%
    mutate("target" = target_mean)
  return(submission)
}


#' @export
write_submission <- function() {
  submission_path <- "pollos_petrel/example_r_submission.csv"
  submission <- add_mean_as_target()
  write_csv(submission, submission_path)
}
