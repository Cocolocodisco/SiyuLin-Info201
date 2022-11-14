library(tidyverse, warn.conflicts = FALSE)
library(dplyr,warn.conflicts = FALSE)
library(tidyr,warn.conflicts = FALSE)
library(data.table,warn.conflicts = FALSE)


wildfire <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-af/main/data/FW_Veg_Rem_Combined.csv")

aggregate_table_2 <- data.table(wildfire) %>%
  select(disc_clean_date, state, stat_cause_descr, fire_mag, Temp_pre_30, Prec_pre_15) %>%
  filter(disc_clean_date == "1/1/1992" | disc_clean_date == "1/1/1995" | disc_clean_date == "1/1/1998" | disc_clean_date == "1/1/2001" | disc_clean_date == "1/1/2004" | disc_clean_date == "1/1/2007" | disc_clean_date == "1/1/2010" | disc_clean_date == "1/1/2013" | disc_clean_date == "9/9/2015")



MeanTemp <- aggregate_table_2 %>%
  group_by(Temp_pre_30) %>%
  group_by(stat_cause_descr) %>%
  summarise(Temp_pre_30 = mean(Temp_pre_30))

MeanPrec <- aggregate_table_2 %>%
  group_by(Prec_pre_15) %>%
  group_by(stat_cause_descr) %>%
  summarise(Prec_pre_15 = mean(Prec_pre_15))

MeanMagnitude <- aggregate_table_2 %>%
  group_by(fire_mag) %>%
  group_by(stat_cause_descr) %>%
  summarise(fire_mag = mean(fire_mag))


AggData <- merge(MeanTemp, MeanPrec)
AggregateDataTable <- merge(AggData, MeanMagnitude) 

AggregateDataTable2 <- knitr::kable(AggregateDataTable, "simple", col.names = c("Cause","Temperature","Precipitation","Fire Maginitude"))

            
