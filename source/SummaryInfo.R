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

# The following three entries in the list describe the difference in percentage of wildfire between the Top 1% and Bottom 20% temperature in three key years: 2015, 2004, 
# and 1992 (the earliest year for which data is available). These show the concentration of the total number of wildfires increasing.
temp_top1_2015 <- (income_distribution[769, 3]/networth_sum_2021)*100
percent_temp_2015 <- (income_distribution[774, 3]/networth_sum_2021)*100

summary_info$temp_2015 <- round(temp_top1_2015 - percent_temp_2015, digits = 2)

networth_sum_2018 <- sum(income_distribution[703:708, 3])
percent_wealth_share_top1_2004 <- (income_distribution[703, 3]/networth_sum_2018)*100
percent_wealth_share_bot20_2004 <- (income_distribution[708, 3]/networth_sum_2018)*100

summary_info$percent_inequity_2014 <- round(percent_wealth_share_top1_2018 - percent_wealth_share_bot20_2018, digits = 2)

networth_sum_1992 <- sum(income_distribution[1:6, 3])
percent_wealth_share_top1_1992 <- (income_distribution[1, 3]/networth_sum_1989)*100
percent_wealth_share_bot20_1992 <- (income_distribution[6, 3]/networth_sum_1989)*100

summary_info$percent_inequity_1992 <- round(percent_wealth_share_top1_1989 - percent_wealth_share_bot20_1989, digits = 2)


# The following three entries in the list describe the difference between the mean and median net worth of all income groups within the same three key years as above. 
# If the mean is significantly higher than the median, it shows a disproportionate concentration of wealth in the higher end of the income scale. 
# The net worth of the 40-60% income group is used as a representative value for median net worth. 
mean_wealthgroup_2021 <- mean(income_distribution[769:774, 3])
summary_info$diff_mean_median_2021_dollars <- mean_wealthgroup_2021 - income_distribution[772, 3]

mean_wealthgroup_2018 <- mean(income_distribution[703:708, 3])
summary_info$diff_mean_median_2018_dollars <- mean_wealthgroup_2018 - income_distribution[706, 3]

mean_wealthgroup_1989 <- mean(income_distribution[1:6, 3])
summary_info$diff_mean_median_1989_dollars <- round(mean_wealthgroup_1989 - income_distribution[4, 3])

liability_asset_ratio_top1_2021 <- income_distribution[769, 11]/income_distribution[769, 4]
liability_asset_ratio_bot20_2021 <- income_distribution[774, 11]/income_distribution[774, 4]


# The following entry in the list describes the ratio of liability burden, which we define as the ratio of liabilities to assets, between the top 1% and bottom 20% income earners. 
# This indicates that the bottom 20% face 4 times the liability burden as the top 1%
summary_info$ratio_of_liability_burden_2021 <- round(liability_asset_ratio_bot20_2021/liability_asset_ratio_top1_2021)

summary_table <- as.data.frame(do.call(rbind, summary_info))
