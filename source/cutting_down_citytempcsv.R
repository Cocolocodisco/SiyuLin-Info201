# This R script cut down city_temperature.csv file from data observations around the world
# into just data observations from the United States.

# The dataset was found on Kaggle. The dataset is about "Daily Temperature of Major Cities"
# https://www.kaggle.com/datasets/sudalairajkumar/daily-temperature-of-major-cities

library(dplyr)
data <- read.csv("city_temperature.csv")

united_states <- write.csv((data %>% filter(Country == "US")), file = "united_states.csv", row.names = TRUE)