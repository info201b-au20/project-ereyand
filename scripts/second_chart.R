# Chart 2 by Anush - Maps

library(tidyverse)
library(stringr)
library(USAboundaries)
library(ggmap)
library(maps)
library(mapdata)
library(stringi)
library(patchwork)

usa <- map_data("usa")

state_shape <- map_data("state") %>% 
  mutate(state_name = stri_trans_totitle(region)) %>% 
  mutate(state = state.abb[match(state_name, state.name)])

# Load the working data
data_raw <- read.csv("https://raw.githubusercontent.com/info201b-au20/project-ereyand/gh-pages/panel_2_table_and_counts_v7_2020_03_27.csv")

making_homeless <- data_raw %>% 
  select(homeless_individuals, homeless_veterans, coc_number) %>% 
  mutate(state = str_sub(coc_number, start = 1, end = 2))
  
# joining datasets
combined_data <- left_join(state_shape, making_homeless, by = "state")

# blank theme
blank_theme <- theme_bw() +
  theme(
    axis.line = element_blank(), # remove axis lines
    axis.text = element_blank(), # remove axis labels
    axis.ticks = element_blank(), # remove axis ticks
    axis.title = element_blank(), # remove axis titles
    plot.background = element_blank(), # remove gray background
    panel.grid.major = element_blank(), # remove major grid lines
    panel.grid.minor = element_blank(), # remove minor grid lines
    panel.border = element_blank() # remove border around plot
  )

# Highest Number of Homeless Vets by State
vets_map <- ggplot(data = combined_data) + 
  geom_polygon(aes(x = long, y = lat, fill = homeless_veterans, group = group),
               color = "black") + 
  coord_fixed(1.3) +
  scale_fill_continuous(limits = c(0, max(combined_data$homeless_veterans)), na.value = "white",
                        low = "#fee0d2", high = "#de2d26") +
  blank_theme +
  ggtitle("Highest Number of Homeless Veterans by State")

 

# Highest Number of Homeless Individuals by State
ind_map <- ggplot(data = combined_data) + 
  geom_polygon(aes(x = long, y = lat, fill = homeless_individuals, group = group),
               color = "black") + 
  coord_fixed(1.3) +
  scale_fill_continuous(limits = c(0, max(combined_data$homeless_individuals)), na.value = "white",
                        low = "#fee0d2", high = "#de2d26") +  
  blank_theme +
  ggtitle("Highest Number of Homeless Individuals by State")
  

  comparison_plots <- ind_map/vets_map





