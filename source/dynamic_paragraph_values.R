# This is the R script for the values referenced in the dynamic paragraph in the index.Rmd file.

library(dplyr)
library(tidyverse)

fire_data <- read.csv("../data/FW_Veg_Rem_Combined.csv")
us_temp_data <- read.csv("../data/united_states.csv")
acres_burned_data <- read.csv("../data/acres_burned_in_wildfires_usafacts.csv")

testing <- as.data.frame(table(fire_data$stat_cause_descr)) %>% 
  filter(Freq == max(Freq)) %>% 
  pull(Var1)

most_common_cause <- function() {
  causes <- unique(fire_data$stat_cause_descr)
  answer <- causes[which.max(tabulate(match(fire_data, causes)))]
  return(answer)
}
  
# most_common_state <- as.data.frame(table(fire_data$state)) %>%
#  filter(Freq) %>%
  



# reference: https://www.statology.org/r-count-number-of-occurrences-in-column/
# reference: https://bookdown.org/kdonovan125/ibis_data_analysis_r4/working-with-tables-in-r.html

  
  
  
  
 