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

data2 <- data |>
  mutate(
    total_bedrooms = if_else(is.na(total_bedrooms), mean(total_bedrooms, na.rm = TRUE), total_bedrooms)
  )

numeric_columns <- sapply(data, is.numeric)
numeric_data <- data[, numeric_columns]
column_means <- colMeans(numeric_data, na.rm = TRUE)
print(column_means)

#### Grab a portion of the data as train data and test data. ####
rows <- sample(1:20641, 641, replace=FALSE) 
train<- data2[rows,]
test=data2[-rows,]


#### Save data ####
write_csv(train, "trainfinal.csv")
write_csv(test, "testfinal.csv")

write_parquet(train, "trainfinal.parquet")
write_parquet(test, "testfinal.parquet")
