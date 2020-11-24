# third chart
# Load packages
library(ggplot2)
library(tidyverse)
library(stringr)

# Load raw data
raw_data <- read.csv("https://raw.githubusercontent.com/info201b-au20/project-ereyand/gh-pages/panel_2_table_and_counts_v7_2020_03_27.csv")

# Load data
data <- raw_data %>% 
  mutate(state = str_sub(coc_number, start = 1, end = 2))


homeless_data <- data %>% 
  group_by(state) %>% 
  mutate(sheltered_total_homeless_veterans = 
           as.numeric(sheltered_total_homeless_veterans, na.rm = TRUE)) %>% 
  mutate(unsheltered_homeless_veterans = 
           as.numeric(unsheltered_homeless_veterans, na.rm = TRUE)) %>% 
  select(sheltered_total_homeless_veterans, unsheltered_homeless_veterans)

# Florida state homeless data
homeless_fl <- homeless_data %>% 
  filter(state == "FL")

fl_plot <- ggplot(data = homeless_fl) +
  geom_point(mapping = aes(x = unsheltered_homeless_veterans,
                           y = sheltered_total_homeless_veterans)) +
  ggtitle("Homeless Veterans in Florida")

# New York state homeless data
homeless_ny <- homeless_data %>% 
  filter(state == "NY")

ny_plot <- ggplot(data = homeless_ny) +
  geom_point(mapping = aes(x = unsheltered_homeless_veterans,
                           y = sheltered_total_homeless_veterans)) +
  ggtitle("Homeless Veterans in New York")


