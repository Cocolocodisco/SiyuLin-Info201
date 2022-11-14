

library(ggplot2)
library(dplyr)
library(tidyverse)
library(gridExtra)


# read in the data
# https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-af/main/data/Lightning-Human-Caused_2.csv
# Create a new data frame include the data of Lightning Acres from row 3 to row 23
Lightning_Acres <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-af/main/data/Lightning-Human-Caused_2.csv", header = TRUE, stringsAsFactors = FALSE, skip = 24, nrows = 20)
Human_Caused_Acres <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-af/main/data/Lightning-Human-Caused_2.csv", header = TRUE, stringsAsFactors = FALSE, skip = 76, nrows = 20)
# ignore the , in the number

Lightning_Acres <- Lightning_Acres %>% mutate(across(everything(), ~ gsub(",", "", .x)))

Human_Caused_Acres <- Human_Caused_Acres %>% mutate(across(everything(), ~ gsub(",", "", .x)))
# ignore the NA in the data
Lightning_Acres <- Lightning_Acres %>% mutate(across(everything(), ~ gsub("NA", "0", .x)))

Human_Caused_Acres <- Human_Caused_Acres %>% mutate(across(everything(), ~ gsub("NA", "0", .x)))

Lightning <- ggplot(Lightning_Acres, aes(x = as.factor(Year), y = as.numeric(Alaska), fill = "Alaska")) +
  geom_bar(stat = "identity", position = "stack") +
  geom_bar(aes(y = as.numeric(Northwest), fill = "Northwest"), stat = "identity", position = "stack") +
  geom_bar(aes(y = as.numeric(Northern..California.), fill = "NorthernCalifornia"), stat = "identity", position = "stack") +
  geom_bar(aes(y = as.numeric(Southern..California), fill = "SouthernCalifornia"), stat = "identity", position = "stack") +
  geom_bar(aes(y = as.numeric(Northern..Rockies), fill = "NorthernRockies"), stat = "identity", position = "stack") +
  geom_bar(aes(y = as.numeric(Great.Basin), fill = "GreatBasin"), stat = "identity", position = "stack") +
  geom_bar(aes(y = as.numeric(Western..Great.Basin.), fill = "WesternGreatBasin"), stat = "identity", position = "stack") +
  geom_bar(aes(y = as.numeric(Southwest), fill = "Southwest"), stat = "identity", position = "stack") +
  geom_bar(aes(y = as.numeric(Rocky.Mountains), fill = "RockyMountains"), stat = "identity", position = "stack") +
  geom_bar(aes(y = as.numeric(Eastern.Area), fill = "EasternArea"), stat = "identity", position = "stack") +
  geom_bar(aes(y = as.numeric(Southern.Area), fill = "SouthernArea"), stat = "identity", position = "stack") +
  labs(x = "Year", y = "Lightning Acres", title = "Lightning Acres by Year and Area") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  guides(fill = guide_legend(title = "Area"))

Human <- ggplot(Human_Caused_Acres, aes(x = as.factor(Year), y = as.numeric(Alaska), fill = "Alaska")) +
  geom_bar(stat = "identity", position = "stack") +
  geom_bar(aes(y = as.numeric(Northwest), fill = "Northwest"), stat = "identity", position = "stack") +
  geom_bar(aes(y = as.numeric(Northern..California.), fill = "NorthernCalifornia"), stat = "identity", position = "stack") +
  geom_bar(aes(y = as.numeric(Southern..California), fill = "SouthernCalifornia"), stat = "identity", position = "stack") +
  geom_bar(aes(y = as.numeric(Northern..Rockies), fill = "NorthernRockies"), stat = "identity", position = "stack") +
  geom_bar(aes(y = as.numeric(Great.Basin), fill = "GreatBasin"), stat = "identity", position = "stack") +
  geom_bar(aes(y = as.numeric(Western..Great.Basin.), fill = "WesternGreatBasin"), stat = "identity", position = "stack") +
  geom_bar(aes(y = as.numeric(Southwest), fill = "Southwest"), stat = "identity", position = "stack") +
  geom_bar(aes(y = as.numeric(Rocky.Mountains), fill = "RockyMountains"), stat = "identity", position = "stack") +
  geom_bar(aes(y = as.numeric(Eastern.Area), fill = "EasternArea"), stat = "identity", position = "stack") +
  geom_bar(aes(y = as.numeric(Southern.Area), fill = "SouthernArea"), stat = "identity", position = "stack") +
  labs(x = "Year", y = "Lightning Acres", title = "Lightning Acres by Year and Area") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  guides(fill = guide_legend(title = "Area"))

Lightning_and_Human <- grid.arrange(Lightning, Human, ncol = 2)
