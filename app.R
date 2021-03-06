# Project web page Final Deliverable
# Where everything comes together

# Load necessary packages
library(shiny)
library(tidyverse)
library(ggplot2)
library(plotly)


# Source relevant user interface and server
source("app_ui.R")
source("app_server.R")

# create shiny app
shinyApp(ui = ui, server = server)