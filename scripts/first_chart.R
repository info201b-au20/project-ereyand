# Chart 1 by Anush - Columns
library(tidyverse)
library(ggplot2)
library(stringr)

# Load the working data
data_raw <- read.csv("https://raw.githubusercontent.com/info201b-au20/project-ereyand/gh-pages/panel_2_table_and_counts_v7_2020_03_27.csv")

making_homeless <- data_raw %>% 
  select(homeless_individuals, homeless_veterans, coc_number) %>% 
  mutate(state = str_sub(coc_number, start = 1, end = 2))


# States with highest numbers of homeless individuals and veterans
homeless_ind <- making_homeless %>%
  group_by(state) %>%
  filter(homeless_individuals == max(homeless_individuals)) %>%
  select(homeless_individuals)

homeless_vet <- making_homeless %>%
  group_by(state) %>%
  filter(homeless_veterans == max(homeless_veterans)) %>%
  select(homeless_veterans)

# Highest Number of Homeless Individuals by State
individuals <- ggplot(data = homeless_ind) +
  geom_col(mapping = aes(x = state, y = homeless_individuals, fill = state)) +
  coord_flip() +
labs(x = "State", y = "Homeless Individuals",
     title = "Highest Number of Homeless Individuals by State")

# Highest Number of Homeless Veterans by State
vets <- ggplot(data = homeless_vet) +
  geom_col(mapping = aes(x = state, y = homeless_veterans, fill = state)) +
  coord_flip() +
  labs(x = "State", y = "Homeless Veterans",
       title = "Highest Number of Homeless Veterans by State")

comparison_plots <- individuals/vets

