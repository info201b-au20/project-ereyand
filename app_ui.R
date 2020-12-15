# Project web page

# Load necessary packages
library(shiny)
library(tidyverse)
library(ggplot2)
library(plotly)

feature_input <- selectInput(
  inputId = "feature",
  label = "Area of Interest",
  choices = national$coc_name,
  selected = "coc_number"
)

# create introduction page
intro_panel <- tabPanel(
  "Introduction",
  p("We will be discussing and analyzing the people experiencing homelessness.")
)

# create first chart page
first_panel <- tabPanel(
  "Chart number one",
  p("Our first chart."),
  feature_input,
  checkboxInput("smooth", label = strong("Show Trendline"), value = TRUE),
  plotOutput("plot"),
)

# create second chart page
second_panel <- tabPanel(
  "Chart number two",
  p("Our second chart.")
)

# create third chart page
third_panel <- tabPanel(
  "Chart number three",
  p("Our third chart.")
)

# create summary page
# UI ---------------------
summary_sidebar <- sidebarPanel(
  p("State"),
  selectInput( 
    inputId = "states",
    label = "Choose a state",
    choices = summary_df$state )
)

sum_graph <- mainPanel(
  plotlyOutput("sum_plot")
  
)

summary_panel <- tabPanel(
  "Summary",
  titlePanel("coc pop of each state"),
 sidebarLayout(summary_sidebar,
               sum_graph))



# Create ui variable
ui <- navbarPage(
  "Homelessness in the United States",
  intro_panel,
  first_panel,
  second_panel,
  third_panel,
  summary_panel
      )
    
