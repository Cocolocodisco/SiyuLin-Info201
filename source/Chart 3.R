
library(ggplot2)
library(dplyr)
library(tidyverse)

# read in the data
# https://github.com/info201a-au2022/project-group-7-section-af/blob/main/data/united_states.csv

united_states <- read_csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-af/main/data/united_states.csv")

# rearrange the data
# put states in four groups: Northeast, Midwest, South, West

united_states <- united_states %>%
  mutate(region = case_when(
    State %in% c("Connecticut", "Maine", "Massachusetts", "New Hampshire", "Rhode Island", "Vermont", "New Jersey", "New York", "Pennsylvania") ~ "Northeast",
    State %in% c("Illinois", "Indiana", "Michigan", "Ohio", "Wisconsin", "Iowa", "Kansas", "Minnesota", "Missouri", "Nebraska", "North Dakota", "South Dakota") ~ "Midwest",
    State %in% c("Delaware", "Florida", "Georgia", "Maryland", "North Carolina", "South Carolina", "Virginia", "District of Columbia", "West Virginia", "Alabama", "Kentucky", "Mississippi", "Tennessee", "Arkansas", "Louisiana", "Oklahoma", "Texas") ~ "South",
    State %in% c("Arizona", "Colorado", "Idaho", "Montana", "Nevada", "New Mexico", "Utah", "Wyoming", "Alaska", "California", "Hawaii", "Oregon", "Washington") ~ "West"
  ))

# change region NA to "Other"

united_states <- united_states %>%
  mutate(region = ifelse(is.na(region), "Other", region))
# get the average temperature for each region in each year

united_states <- united_states %>%
  group_by(region, Year) %>%
  summarise(avg_temp = mean(AvgTemperature))


# plot the data
# make a Scatter plot Martix to show the relationship between average temperature and year for each region

Matrix <- ggplot(united_states, aes(x = Year, y = avg_temp, color = region)) +
  geom_point() +
  geom_smooth(method = "lm") +
  facet_wrap(~region, scales = "free") +
  #make the plot more readable
  #Make the title in the middle
  
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  
  labs(title = "Average Temperature in the United States by Region",
       x = "Year",
       y = "Average Temperature (Fahrenheit)")

