# Project web page

# Load necessary packages
library(shiny)
library(tidyverse)
library(ggplot2)
library(plotly)

national <- read.csv("https://raw.githubusercontent.com/info201b-au20/project-ereyand/gh-pages/panel_2_table_and_counts_v7_2020_03_27.csv", stringsAsFactors = F)
summary_df <- read_excel("homelessness_sum_new.xlsx", 
            col_types = c("text", "text", "numeric"))
# Summary Plot for chronically homeless, homeless veterans and homeless youth
make_sum_plot <- function(df, states) {
  
  df <- df %>%
    filter(state == states) 
  
sum_plot <- ggplot(data = df, mapping = aes(x = homeless_group, y = coc_population)) +
    geom_bar(aes(color = "red", stat = "identity") 
 )
}



# Create server variable

server <- function(input, output) {
  output$plot <- renderPlot({
    plot_data <- na.omit(national) %>%
      filter(total_homeless > 0)
    p <- ggplot(
      data = plot_data,
      mapping = aes_string(x = input$feature, y = national$total_homeless, color = "coc_number")
    ) + labs(x = "Area", y = "Total Number of Homeless Individuals") +
      geom_point()
    
    if (input$smooth) {
      p <- p + geom_smooth(se = FALSE)
    }
    p
  })
  summary_df$homeless_group <- factor(
    summary_df$homeless_group, 
    levels = c("chronically_homeless", "homeless_veterans", "sheltered_youth"))

  output$sum_plot <- renderPlotly({
    return(make_sum_plot(summary_df, input$states))
    
  })
  
}