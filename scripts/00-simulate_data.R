#### Preamble ####
# Purpose: Simulates some interesting variables from California housing market data.
# Author: Shuyuan Zheng
# Date: 10 April 2024
# Contact:  Sheldon.Zheng@mail.utoronto.ca 
# License: MIT
# Pre-requisites: No

#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
simulated_housing_data <-
  tibble(
    median_income = runif(n = 1000, min = 0, max = 15),
    median_house_value = runif(n = 1000, min = 10000, max = 500000),
    total_rooms = runif(n = 1000, min = 1, max = 10000) |> floor(),
    total_bedrooms = runif(n = 1000, min = 1, max = 2000) |> floor(),
    population = runif(n = 1000, min = 3, max = 10000) |> floor(),
    households = runif(n = 1000, min = 1, max = 3000) |> floor(),
    ocean_proximity = sample(c("NEAR BAY", "INLAND", "<1H OCEAN", "NEAR OCEAN", "ISLAND"), 1000, replace = TRUE)
  )

#### Add tests for simulated data ####
# Expect that all values are within the specified ranges.
all(simulated_housing_data$median_income >= 0 & simulated_housing_data$median_income <= 15)
all(simulated_housing_data$median_house_value >= 10000 & simulated_housing_data$median_house_value <= 500000)
all(simulated_housing_data$total_rooms >= 1 & simulated_housing_data$total_rooms <= 10000)
all(simulated_housing_data$total_bedrooms >= 1 & simulated_housing_data$total_bedrooms <= 2000)
all(simulated_housing_data$population >= 3 & simulated_housing_data$population <= 10000)
all(simulated_housing_data$households >= 1 & simulated_housing_data$households <= 3000)
all(simulated_housing_data$ocean_proximity %in% c("NEAR BAY", "INLAND", "<1H OCEAN", "NEAR OCEAN", "ISLAND"))



