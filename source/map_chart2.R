# this is the source code for a map detailing a sample of 50000 fires
# that have happened in the United States from 1992-2015

library(tidyverse)
library(dplyr)
library(ggplot2)
library(maps)

fire_data <- read.csv("info201/project-group-7-section-af/data/FW_Veg_Rem_Combined.csv")

# CHOICE 1: PLOTTING EVERY FIRE ON THE UNITED STATES MAP (vetoed for now)
# this variable filters the .csv file into just state, latitude, and longitude
# location_coordinates <- fire_data %>% select(state, latitude, longitude)

# this variable adds a column to the location_coordinates that reports the state 
# (not just abbreviations), which can be used for the join functions
# new_fire_data <- mutate(location_coordinates, 
#                         region = tolower(state.name[match(state, state.abb)]))

# basic us map reference
us_map <- map_data("state")

# plots out the basic us map
map <- ggplot() + 
  geom_polygon(data = us_map, aes(x=long, y=lat, group=group),
               color="black", fill="lightblue" )

# this plots out all the fire coordinates
# fire_but_dots <- map + 
#   geom_point(data = location_coordinates, aes(x=longitude, y=latitude), 
#              color = "gold", size = 0.1)


# CHOICE 2: PLOTTING THE AMOUNT OF FIRES IN EACH STATE (IN A DENSITY TYPE MAP)

# this variable selects only the state and the discovery date of the fire,
# and adds a column that reports the year the fire was discovered.
# reference: https://stackoverflow.com/questions/36568070/extract-year-from-date
location_density <- fire_data %>% select(state, disc_clean_date)%>%
  mutate(disc_clean_date, year = format(as.Date(location_density$disc_clean_date, 
                                                format="%m/%d/%Y"),"%Y"))


# reference: https://www.marsja.se/r-count-the-number-of-occurrences-in-a-column-using-dplyr/
# this counts the number of fires that each state has had
count_state <- location_density %>%
  count(state)
# this counts the number of fires that each state has had per year
count_by_year <- location_density %>%
  group_by(year) %>%
  count(state)

# this adds a new column that has the entire state name (instead of just abbreviations)
new_count_state <- count_state %>%
  mutate(region = tolower(state.name[match(state, state.abb)]))

# merges the count data into the map data (so that it can be plotted)
data_merge <- inner_join(us_map, new_count_state, by = "region")

# this plots out the map of the US, with different states shaded differently
# depending on the number of fires they have experienced from 1992-2015
fire_but_shades <- map + 
  geom_polygon(data = data_merge, aes(x=long, y=lat, group=group, fill = n),
             color = "white", size = 0.1)
