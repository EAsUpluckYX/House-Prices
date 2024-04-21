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
numeric_data <- data[, numeric_columns]
column_means <- colMeans(numeric_data, na.rm = TRUE)
print(column_means)

#### Grab a portion of the data as train data and test data. ####
rows <- sample(1:20641, 641, replace=FALSE) 
train<- data[rows,]
test=data[-rows,]



#### Save data ####
write_csv(train, "data/analysis_data/train_data.csv")
write_csv(test, "data/analysis_data/test_data.csv")
write_csv(data, "data/analysis_data/cleaned_data.csv")

write_parquet(train, "data/analysis_data/train_data.parquet")
write_parquet(test, "data/analysis_data/test_data.parquet")
write_parquet(data, "data/analysis_data/cleaned_data.parquet")
