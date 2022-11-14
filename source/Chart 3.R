library(ggplot2)
library(dplyr)
library(tidyverse)

# read in the data
# https://github.com/info201a-au2022/project-group-7-section-af/blob/main/data/united_states.csv

united_states <- read_csv("https://raw.githubusercontent.com/info201a-au2022/project-group-7-section-af/main/data/united_states.csv")

# get the average temperature for each year in each state and store it in a new data frame
avg_temp <- united_states %>%
  group_by(Year, State) %>%
  summarise(avg_temp = mean(AvgTemperature)) %>%
  ungroup()
# make the Scatter plot Matrix
Matrix <- ggplot(avg_temp, aes(x = Year, y = avg_temp)) +
  geom_point() +
  facet_wrap(~State, scales = "free") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 6),
        axis.text.y = element_text(size = 6),
        plot.title = element_text(hjust = 0.5, face = "bold", size = 12, color = "red"),
        axis.title.x = element_text(face = "bold"),
        axis.title.y = element_text(face = "bold")) +
  labs(title = "Average Temperature in the United States by Year",
       x = "Year",
       y = "Average Temperature")

      

