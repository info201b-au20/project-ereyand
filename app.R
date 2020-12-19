# Project web page
# Where everything comes together

# Load necessary packages
library(shiny)
library(tidyverse)
library(ggplot2)
library(plotly)

<<<<<<< HEAD

=======
>>>>>>> b242a8758d78197832813e0a2d2b979ea92bc05b
# Source relevant user interface and server
source("app_ui.R")
source("app_server.R")

# create shiny app
shinyApp(ui = ui, server = server)