# summary chart
# load tidyverse and stringr
library(tidyverse)
library(stringr)
national <- read.csv("https://raw.githubusercontent.com/info201b-au20/project-ereyand/gh-pages/panel_2_table_and_counts_v7_2020_03_27.csv")
# Group CoC
homelessness_summary <- national %>% 
  mutate(state = str_sub(coc_number, 1, 2 )) %>%
  filter(!is.na(chronically_homeless)) %>%
  group_by(state) %>% 
  summarise(chronically_homeless = max(chronically_homeless), 
            homeless_veterans = max(homeless_veterans),
            sheltered_youth = max(sheltered_total_homeless_unaccompanied_youth_under_25))
view(homelessness_summary)
