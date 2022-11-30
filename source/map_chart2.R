# this is the source code for a map detailing a sample of 50000 fires
# that have happened in the United States from 1992-2015
# general reference: https://remiller1450.github.io/s230s19/Intro_maps.html

library(tidyverse)
library(dplyr)
library(ggplot2)
library(usmap)
library(shiny)

fire_data <- read.csv("../data/FW_Veg_Rem_Combined.csv")

# this variable selects only the state and the discovery date of the fire,
# and adds a column that reports the year the fire was discovered.
# reference: https://stackoverflow.com/questions/36568070/extract-year-from-date
placeholder_location_density <-fire_data %>% select(state, disc_clean_date)
location_density <- fire_data %>% select(state, disc_clean_date) %>% 
  mutate(disc_clean_date, year = format(as.Date(placeholder_location_density$disc_clean_date, 
                                                format="%m/%d/%Y"),"%Y"))


# reference: https://www.marsja.se/r-count-the-number-of-occurrences-in-a-column-using-dplyr/
# this counts the number of fires that each state has had
count_state <- location_density %>%
  count(state)

max(count_state$n)
# this counts the number of fires that each state has had per year
count_by_year <- location_density %>%
  group_by(year) %>%
  count(state)

# this adds a new column that has the entire state name (instead of just abbreviations)
new_count_state <- count_state %>%
  mutate(full = state.name[match(state, state.abb)])

# basic us map reference
us_map <- us_map("state")

# plots out the basic us map (dot map is for fire coordinates)
map <- ggplot() + 
  geom_polygon(data = us_map, aes(x=x, y=y, group=group),
               color="black", fill="lightblue" )

# merges the count data into the map data (so that it can be plotted)
data_merge <- inner_join(us_map, new_count_state, by = "full")

# this plots out the map of the US, with different states shaded differently
# depending on the number of fires they have experienced from 1992-2015
fire_but_shades <- map + 
  geom_polygon(data = data_merge, aes(x = x, y = y, group=group, fill = n),
             color = "white", linewidth = 0.5)

fire_but_better_shades <- fire_but_shades + scale_fill_continuous(name = "fire count",
                          low = "pink", high = "orange", limits = c(0,max(count_state$n)), 
                          breaks = c(1000, 2000, 3000, 4000, 5000, 6000, 7000), na.value = "grey50") + 
                          labs(title = "Fire Density Map in Mainland United States from 1992 - 2015",
                               x = "", y = "")

ggplotly(fire_but_better_shades)
