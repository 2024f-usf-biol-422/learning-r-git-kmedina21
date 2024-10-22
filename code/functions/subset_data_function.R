# Load packages
library(dplyr)
library(ggplot2)
library(knitr)

# First function
subset_snp_data <- function(dataset, sample_id) {

  # Read the CSV file into a data frame
  snp_data <- read.csv("data/sample_snp_data.csv")

  # Subset the data to include only the specified sample
  subset_data <- snp_data[snp_data$sample == sample_id, ]

  # Return the subsetted data frame
  return(subset_data)
}
