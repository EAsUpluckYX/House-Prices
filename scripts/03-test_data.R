#### Preamble ####
# Purpose: Tests the cleaned housing data based on our expectations from data cleaning.
# Author: Shuyuan Zheng
# Date: 10 April 2024
# Contact: Sheldon.Zheng@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need cleaned data from data cleaning process


#### Workspace setup ####
library(arrow)
library(tidyverse)

#### Test data ####
cleaned_data <- read_parquet("data/analysis_data/train_data.parquet")
cleaned_data1 <- read_parquet("data/analysis_data/test_data.parquet")

# Test expectations for 'median_house_value'
# Expect that values are within a reasonable range for California housing.
all(cleaned_data$median_house_value >= 10000 & cleaned_data$median_house_value <= 1000000)
all(cleaned_data1$median_house_value >= 10000 & cleaned_data$median_house_value <= 1000000)

# Test expectations for 'total_bedrooms'
# Expect that there are no negative values for bedrooms.
all(cleaned_data$total_bedrooms >= 0)
all(cleaned_data1$total_bedrooms >= 0)

# Test expectations for 'ocean_proximity'
# Expect that this categorical variable only contains specific categories.
all(cleaned_data$ocean_proximity %in% c("NEAR BAY", "INLAND", "<1H OCEAN", "NEAR OCEAN", "ISLAND"))
all(cleaned_data1$ocean_proximity %in% c("NEAR BAY", "INLAND", "<1H OCEAN", "NEAR OCEAN", "ISLAND"))

# Test expectations for 'house_median_age'
# Expect that the age of the house is between 0 and 100 years.
all(cleaned_data$housing_median_age >= 0 & cleaned_data$housing_median_age <= 100)
all(cleaned_data1$housing_median_age >= 0 & cleaned_data$housing_median_age <= 100)

# Test data integrity
# Expect that there are no missing values in key columns.
all(complete.cases(cleaned_data))
all(complete.cases(cleaned_data1))
