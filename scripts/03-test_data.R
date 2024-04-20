#### Preamble ####
# Purpose: Cleans the raw data so that it can be analyzed.
# Author: Shuyuan Zheng
# Date: 10 April 2024
# Contact: Sheldon.Zheng@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have manually downloaded the data.

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Clean data ####
data <- read_csv("data/raw_data/California Housing Prices_1597_1.csv")

data <- data |>
  mutate(
    total_bedrooms = if_else(is.na(total_bedrooms), mean(total_bedrooms, na.rm = TRUE), total_bedrooms)
  )

numeric_columns <- sapply(data, is.numeric)
data <- data |>
  mutate(across(where(is.numeric), ~if_else(is.na(.), mean(., na.rm = TRUE), .)))

column_means <- colMeans(select(data, where(is.numeric)), na.rm = TRUE)
print(column_means)

#### Save data ####
write_csv(data, "data/analysis_data/cleaned_data.csv")
write_parquet(data, "data/analysis_data/cleaned_data.parquet")
