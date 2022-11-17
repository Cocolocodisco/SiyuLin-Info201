library(tidyverse, warn.conflicts = FALSE)
library(dplyr,warn.conflicts = FALSE)
library(tidyr,warn.conflicts = FALSE)
library(data.table,warn.conflicts = FALSE)


wildfire <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-af/main/data/FW_Veg_Rem_Combined.csv")

most_common_cause <- as.data.frame(table(wildfire$stat_cause_descr)) %>% 
  group_by(wildfire$disc_pre_year) %>%
  filter(Freq == max(Freq)) %>% 
  pull(Var1)

most_common_state <- as.data.frame(table(wildfire$state)) %>%
  group_by(wildfire$disc_pre_year) %>%
  filter(Freq == max(Freq)) %>%
  pull(Var1)

most_discovery_month <- as.data.frame(table(wildfire$discovery_month)) %>%
  group_by(wildfire$disc_pre_year) %>%
  filter(Freq == max(Freq)) %>%
  pull(Var1)
  
AggregateDataTable <- merge(most_common_cause,most_common_state,most_discovery_month) 

AggregateDataTable <- knitr::kable(AggregateDataTable, "simple", col.names = c("Year", "Most caused by reasons", "State that had the most", "Months that had the most"))


