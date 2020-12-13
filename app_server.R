# Project web page

# Load necessary packages
library(shiny)
library(tidyverse)
library(ggplot2)
library(plotly)

national <- read.csv("https://raw.githubusercontent.com/info201b-au20/project-ereyand/gh-pages/panel_2_table_and_counts_v7_2020_03_27.csv", stringsAsFactors = F)

# Create server variable

server <- function(input, output) {
  output$plot <- renderPlot({
    plot_data <- national %>%
      filter(total_homeless > 0)
    p <- ggplot(
      data = plot_data,
      mapping = aes_string(x = input$feature, y = national$total_homeless, color = "coc_number")
    ) + labs(x = "Year", y = input$feature) +
      geom_point()
    
    if (input$smooth) {
      p <- p + geom_smooth(se = FALSE)
    }
    p
  })
}