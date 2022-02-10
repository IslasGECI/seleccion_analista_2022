library(tidyverse)

read_training_dataset <- function() {
    training_dataset_path <- "pollos_petrel/train.csv"
    training_dataset = read_csv(training_dataset_path)
    return(training_dataset)
}
