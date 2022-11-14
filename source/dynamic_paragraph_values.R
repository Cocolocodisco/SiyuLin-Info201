# This is the R script for the values referenced in the dynamic paragraph in the index.Rmd file.

library(dplyr)
library(tidyverse)

fire_data <- read.csv("../data/FW_Veg_Rem_Combined.csv")
us_temp_data <- read.csv("../data/united_states.csv")
acres_burned_data <- read.csv("../data/acres_burned_in_wildfires_usafacts.csv")

most_common_cause <- as.data.frame(table(fire_data$stat_cause_descr)) %>% 
  filter(Freq == max(Freq)) %>% 
  pull(Var1)
  
most_common_state <- as.data.frame(table(fire_data$state)) %>%
  filter(Freq == max(Freq)) %>%
  pull(Var1)
  
most_discovery_month <- as.data.frame(table(fire_data$discovery_month)) %>%
  filter(Freq == max(Freq)) %>%
  pull(Var1)

highest_average_temperature <- us_temp_data %>%
  group_by(State) %>%
  summarize(avg = mean(AvgTemperature)) %>%
  ungroup() %>%
  filter(avg == max(avg)) %>%
  pull(State, avg)

where_is_texas <- us_temp_data %>%
  filter(State == "Texas") %>%
  summarize(average = mean(AvgTemperature))

# reference: https://www.statology.org/r-count-number-of-occurrences-in-column/
# reference: https://bookdown.org/kdonovan125/ibis_data_analysis_r4/working-with-tables-in-r.html

  
  
  
  
 