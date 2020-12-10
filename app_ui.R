# Project web page

# Load necessary packages
library(shiny)
library(tidyverse)
library(ggplot2)
library(plotly)

# create introduction page
intro_panel <- tabPanel(
  "Introduction",
  p("We will be discussing and analyzing the people experiencing homelessness.")
)

# create first chart page
first_panel <- tabPanel(
  "Chart number one",
  p("Our first chart.")
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
summary_panel <- tabPanel(
  "Summary",
  p("What we learned.")
)

# Create ui variable
ui <- navbarPage(
  "Homelessness in the United States",
  intro_panel,
  first_panel,
  second_panel,
  third_panel,
  summary_panel
)