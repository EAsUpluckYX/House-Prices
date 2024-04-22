#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

library(tidyverse)
library(rstanarm)

#### Read data ####
data_model <- read_csv("data/analysis_data/test_data.csv")

### Model data ####
first_model <-
  stan_glm(
    formula = median_house_value ~ total_bedrooms + housing_median_age+median_income,
    data = data_model,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )





#### Save model ####
saveRDS(
  first_model,
  file = "first_model1.rds"
)

