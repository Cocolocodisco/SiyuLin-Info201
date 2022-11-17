library(tidyverse, warn.conflicts = FALSE)
library(dplyr, warn.conflicts = FALSE)
library(tidyr, warn.conflicts = FALSE)
library(data.table,warn.conflicts = FALSE)

#reads the data file
wildfire <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-af/main/data/FW_Veg_Rem_Combined.csv")
aggregate_table <- wildfire %>%
  mutate (disc_clean_date, year = format (as.Date (wildfire$disc_clean_date,
                                                    format="%m/%d/%Y"), "%Y")) %>%
  select(year, state, stat_cause_descr, discovery_month)
test <- sort(as.numeric(unique (aggregate_table$year)))

#filters the data to get the state with the most wildfires
max_state <- aggregate_table %>%
  select(year, state) %>%
  group_by(year) %>%
  count (state) %>%
  filter (n == max(n)) %>%
  pull (state)

#filters the data to get the mnonth with the most wildfires
max_discovery_month <- aggregate_table %>%
  select(year, discovery_month) %>%
  group_by(year) %>%
  count(discovery_month) %>%
  filter (n== max(n)) %>%
  pull(discovery_month)

#filters the data to get the most listed reason of the wildfires
max_stat_cause_descr<- aggregate_table %>%
  select(year, stat_cause_descr) %>%
  group_by(year) %>%
  count(stat_cause_descr) %>%
  filter (n == max(n)) %>%
  pull (stat_cause_descr)

#combines the data warngled and makes the table
combine_tables <- data.frame(test, max_state, max_stat_cause_descr, max_discovery_month)
print_aggregate_table <- knitr::kable(combine_tables, "simple",
                                      kol.names = c("Year","State", "Cause of Fire", "Month it was discovered"))
