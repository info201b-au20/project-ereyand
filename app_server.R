# Project web page Final Deliverable

# Load necessary packages
library(shiny)
library(tidyverse)
library(ggplot2)
library(plotly)
library(readxl)

national <- read.csv("https://raw.githubusercontent.com/info201b-au20/project-ereyand/gh-pages/panel_2_table_and_counts_v7_2020_03_27.csv", stringsAsFactors = F)
data <- national %>% 
  mutate(state = str_sub(coc_number, start = 1, end = 2))

# chart one data
all_homeless_wa <- data %>% 
  filter(state == "WA")

# chart two and three data
homeless_data <- data %>% 
  group_by(state) %>% 
  mutate(sheltered_total_homeless_veterans = 
           as.numeric(sheltered_total_homeless_veterans, na.rm = TRUE)) %>% 
  mutate(unsheltered_homeless_veterans = 
           as.numeric(unsheltered_homeless_veterans, na.rm = TRUE)) %>% 
  select(sheltered_total_homeless_veterans, unsheltered_homeless_veterans)

homeless_wa <- homeless_data %>% 
  filter(state == "WA")
homeless_ca <- homeless_data %>% 
  filter(state == "CA")
homeless_fl <- homeless_data %>% 
  filter(state == "FL")
homeless_ny <- homeless_data %>% 
  filter(state == "NY")


#summary_df <- read_excel("homelessness_sum_new.xlsx", 
                         #col_types = c("text", "text", "numeric"))

# Summary Plot for chronically homeless, homeless veterans and homeless youth
make_sum_plot <- function(df, states) {
  
  df <- df %>%
    filter(state == states) 
  
  sum_plot <- ggplot(data = df, mapping = aes(x = homeless_group, y = coc_population)) +
    geom_bar(aes(color = "red", stat = "identity") 
    )
}


# Create server variable

server <- function(input, output){
  output$sample_plot <- renderPlot({
    sample_data <- na.omit(national) %>%
      filter(total_homeless > 0)
    p_two <- ggplot(
      data = sample_data,
      mapping = aes_string(x = input$feature, y = national$total_homeless, 
                           color = "coc_number")
    ) + labs(x = "Area", y = "Total Number of Homeless Individuals") +
      geom_point()
    
    if (input$smooth) {
      p_two <- p_two + geom_smooth(se = FALSE)
    }
    p_two
  })
  
  output$plot <- renderPlotly({
    plot_data <- na.omit(national) %>%
      filter(total_homeless > 0)
    #p <- ggplot(
      #data = plot_data,
      #mapping = aes(x = input$feature, y = national$total_homeless, color = "coc_number")
    #) + labs(x = "Area", y = "Total Number of Homeless Individuals") +
      #geom_point()
    
    p <- ggplot(plot_data) +
      geom_point(mapping = aes(x = input$feature, y = national$total_homeless, color = "coc_number")) +
      labs(x = "Area", y = "Total Number of Homeless Individuals") 
      
    
    if (input$smooth) {
      p <- p + geom_smooth(se = FALSE)
    }
    p
  })
  
  output$sum_plot <- renderPlotly({
    summary_df$homeless_group <- factor(
      summary_df$homeless_group, 
      levels = c("chronically_homeless", "homeless_veterans", "sheltered_youth"))
    return(make_sum_plot(summary_df, input$states))
    
  })
  
  output$wa_plot <- renderPlotly({
    wash_plot <- ggplot(data = homeless_wa) +
      geom_point(mapping = aes(x = unsheltered_homeless_veterans,
                                      y = sheltered_total_homeless_veterans)) +
      labs(x = "Unsheltered Homeless Veterans", y = "Total Homeless Veterans", 
           title = "Homeless Veterans In Washington")
    if (input$smooth) {
      wash_plot <- wash_plot + geom_smooth(mapping = aes(
        x = unsheltered_homeless_veterans, 
        y = sheltered_total_homeless_veterans, se = TRUE))
    }
    wash_plot
  })
  
  output$ca_plot <- renderPlotly({
    cali_plot <- ggplot(data = homeless_ca) +
      geom_point(mapping = aes(x = unsheltered_homeless_veterans,
                               y = sheltered_total_homeless_veterans)) +
      labs(x = "Unsheltered Homeless Veterans", y = "Total Homeless Veterans", 
           title = "Homeless Veterans In California")
    if (input$smooth) {
      cali_plot <- cali_plot + geom_smooth(mapping = aes(
        x = unsheltered_homeless_veterans, 
        y = sheltered_total_homeless_veterans, se = TRUE))
    }
    cali_plot
  })
  
  output$fl_plot <- renderPlotly({
    flor_plot <- ggplot(data = homeless_fl) +
      geom_point(mapping = aes(x = unsheltered_homeless_veterans,
                               y = sheltered_total_homeless_veterans)) +
      labs(x = "Unsheltered Homeless Veterans", y = "Total Homeless Veterans", 
           title = "Homeless Veterans In Florida")
    if (input$smooth) {
      flor_plot <- flor_plot + geom_smooth(mapping = aes(
        x = unsheltered_homeless_veterans, 
        y = sheltered_total_homeless_veterans, se = TRUE))
    }
    flor_plot
  })
  
  output$ny_plot <- renderPlotly({
    newy_plot <- ggplot(data = homeless_ny) +
      geom_point(mapping = aes(x = unsheltered_homeless_veterans,
                               y = sheltered_total_homeless_veterans)) +
      labs(x = "Unsheltered Homeless Veterans", y = "Total Homeless Veterans", 
           title = "Homeless Veterans In New York")
    if (input$smooth) {
      newy_plot <- newy_plot + geom_smooth(mapping = aes(
        x = unsheltered_homeless_veterans, 
        y = sheltered_total_homeless_veterans, se = TRUE))
    }
    newy_plot
  })
  
  output$plot_one <- renderPlot({
    chart <- ggplot(data = all_homeless_wa) +
      geom_point(mapping = aes_string(x = input$feature, y = input$featuretwo, 
                                      color = "coc_name"))
    return(chart)
  })
}