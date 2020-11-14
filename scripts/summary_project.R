# summary information w/values
# Dataset with Alabama homelessness population
library(tidyverse)
library(stringr)

# load the dataset
national <- read.csv("https://raw.githubusercontent.com/info201b-au20/project-ereyand/gh-pages/panel_2_table_and_counts_v7_2020_03_27.csv")

# view it
# Create list
summary_info <- list()

# Number of observations in dataset
summary_info$obs_national <- nrow(national)

# Number of features in dataset
summary_info$num_features_national <- ncol(national)

# Total number of homeless individuals in United States
summary_info$total_homeless_individual <- national %>% 
  filter(homeless_individuals == max(homeless_individuals, na.rm = TRUE)) %>% 
  pull(homeless_individuals)

# Which city has the smallest homeless population?
summary_info$city_lowest <- national %>% 
  select(coc_name, homeless_individuals) %>% 
  filter(homeless_individuals == min(homeless_individuals, na.rm = TRUE)) %>% 
  pull(coc_name)

# Which city has the largest homeless population?
summary_info$city_highest <- national %>% 
  select(coc_name, homeless_individuals) %>% 
  filter(homeless_individuals == max(homeless_individuals, na.rm = TRUE)) %>% 
  pull(coc_name)
  
# Which city has the highest percentage of its homeless population
# in shelters?
summary_info$highest_prop_in_shelters <- national %>% 
  mutate(per_shelter = 
           sheltered_total_homeless_individuals / homeless_individuals) %>%
  filter(per_shelter == max(per_shelter, na.rm = TRUE)) %>% 
  pull(coc_name)

# Which city has the highest demand for space based  on the
# percentage of its homeless population that isn't in a shelter?
summary_info$highest_demand_for_shelters <- national %>% 
  mutate(demand_shelter = 
           unsheltered_homeless_individuals / homeless_individuals) %>% 
  filter(demand_shelter == max(demand_shelter, na.rm = TRUE)) %>% 
  pull(coc_name)
 
# Which city has the highest number of chronically homeless people?
summary_info$highest_chronically_homeless_city <- national %>% 
  select(coc_name, chronically_homeless) %>% 
  filter(chronically_homeless == max(chronically_homeless, na.rm = TRUE)) %>% 
  pull(coc_name)

# Which city has the highest number of homeless unaccompanied youth?
summary_info$highest_youth <- national %>% 
  select(coc_name, total_homeless_unaccompanied_youth_under_25) %>% 
  filter(total_homeless_unaccompanied_youth_under_25 == max(
    total_homeless_unaccompanied_youth_under_25, na.rm = TRUE)) %>% 
  pull(coc_name)

# Which city has the highest number of verterans experiencing homelessness?
summary_info$highest_veterans <- national %>% 
  select(coc_name, homeless_veterans) %>% 
  filter(homeless_veterans == max(homeless_veterans, na.rm = TRUE)) %>% 
  pull(coc_name)

# Which city has the highest percentage of its homeless veterans in shelters?
summary_info$highest_veterans_in_shelters <- national %>% 
  mutate(vets_in_shelters = 
           sheltered_total_homeless_veterans / homeless_veterans) %>% 
  filter(vets_in_shelters == max(vets_in_shelters, na.rm = TRUE)) %>% 
  pull(coc_name)

# Which city has the highest demand for shelters for homeless veterans?
summary_info$highest_demand_for_veterans <- national %>% 
  mutate(vets_need_shelters = 
           unsheltered_homeless_veterans / homeless_veterans) %>% 
  filter(vets_need_shelters == max(vets_need_shelters, na.rm = TRUE)) %>% 
  pull(coc_name)
