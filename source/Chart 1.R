

library(ggplot2)
library(dplyr)
library(tidyverse)

# read in the data
# https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-af/main/data/FW_Veg_Rem_Combined.csv

FW_Veg_Rem_Combined <- read_csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-af/main/data/FW_Veg_Rem_Combined.csv")

# Create a bar chart show the top 10 causes of fire in US
Causes <- FW_Veg_Rem_Combined %>% 
  count(stat_cause_descr) %>% 
  arrange(desc(n)) %>% 
  head(10) %>% 
  ggplot(aes(x = reorder(stat_cause_descr, n), y = n, fill = stat_cause_descr)) +
  geom_col() +
  coord_flip() +
  labs(x = "Cause of Fire", y = "Number of Fires", title = "Top 10 Causes of Fire in United States") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 20, color = "purple")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme(axis.title.x = element_text(size = 12, face = "bold")) +
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  theme(plot.title = element_text(size = 14, face = "bold")) +
  theme(axis.text.x = element_text(size = 10)) +
  theme(axis.text.y = element_text(size = 10)) +
  theme(legend.position = "none") 
