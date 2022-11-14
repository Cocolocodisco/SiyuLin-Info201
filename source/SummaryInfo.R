setwd("/Users/luischan/Desktop")

library(tidyverse)
library(dplyr)
install.packages("plotly")
library(plotly)


#Our
wildfire <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-af/main/data/FW_Veg_Rem_Combined.csv")

summary_info <- list()

# Number of observations (rows) in the dataset
summary_info$num_observations <- nrow(wildfire)

# Number of variables (columns) in the dataset
summary_info$num_variables <- ncol(wildfire)

#Maximum of magnitude in the dataset
summary_info$state_highest_1992 <- wildfire %>%
  filter(wildifre$disc_clean_date)
  filter(n(state) == max(state)) %>%
  pull(state) 


summary_table <- as.data.frame(do.call(rbind, summary_info))
