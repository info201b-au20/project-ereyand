# Project web page

# Load necessary packages
library(shiny)
library(tidyverse)
library(ggplot2)
library(plotly)

<<<<<<< HEAD
source("app_server.R")

=======
>>>>>>> b242a8758d78197832813e0a2d2b979ea92bc05b
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
  plotlyOutput("plot")
)

# create second chart page
second_panel <- tabPanel(
  "Chart number two",
  titlePanel("Homeless Veterans in the West Coast"),
  plotlyOutput("wa_plot"),
  checkboxInput("smooth", label = strong("Show Trendline"), value = FALSE),
  plotlyOutput("ca_plot"),
  checkboxInput("smooth", label = strong("Show Trendline"), value = FALSE),
  p("Our second chart. We decided to focus on veterans who are experiencing 
    homelessness in the United States. Unfortunately, this is still a large 
    dataset so we decided to separate it into different regions of the country; 
    the West coast (which will be represented with these charts), the Northern 
    & Southern region, and the East coast."),
  p("Additionally, we focused on veterans that were able to seek assistance in 
    shelters and those who were unable due to capacity constraints, the term we 
    use for this demographic is _unsheltered_. Our questions correlate to these 
    specifications, _chart one is on sheltered/unsheltered veteran in the West 
    coast_. The charts we created for these two states show a sad reality, 
    there's a signficant amount of homeless veterans who are unsheltered."),
  p("The `wa_plot` illuminates how this number is in the hundreds for Washington 
    state. But, the `ca_plot` shows how for California, the number of 
    unsheltered homeless veterans is in the *thousands*.")
)

# create third chart page
side_content <- sidebarPanel(
<<<<<<< HEAD
  
  checkboxInput("smooth", label = strong("Show Trendline"), value = FALSE),
  checkboxInput("smooth", label = strong("Show Trendline"), value = FALSE)
)
main_content <- mainPanel(
  plotlyOutput("fl_plot"),
  plotlyOutput("ny_plot"),
  
=======
  plotlyOutput("fl_plot"),
  checkboxInput("smooth", label = strong("Show Trendline"), value = FALSE),
  plotlyOutput("ny_plot"),
  checkboxInput("smooth", label = strong("Show Trendline"), value = FALSE)
)
main_content <- mainPanel(
>>>>>>> b242a8758d78197832813e0a2d2b979ea92bc05b
  p("Lastly, we gathered the data from two east coast states; New York and 
    Florida. These states have many differences that vary geographically, 
    demographically, economically, etc. The charts tell us that sadly, many 
    homeless veterans aren't able to seek refuge in shelters due to capacity."), 
  p("In the `fl_plot`, we can see how significantly more veterans are 
    unsheltered because while the data is more varied, there's a different scale
    on the x-axis. This is very interesting since initially, we believed that 
    the state with the higher population would have a higher percentage of 
    unsheltered veterans (in regards to the East coast).")
)
third_panel <- tabPanel(
  "Chart number three",
  titlePanel("Homeless Veterans in the East Coast"),
  sidebarLayout(
    side_content,
    main_content
  )
)

# create summary page
# UI ---------------------
<<<<<<< HEAD




=======
>>>>>>> b242a8758d78197832813e0a2d2b979ea92bc05b
summary_sidebar <- sidebarPanel(
  p("State"),
  selectInput( 
    inputId = "states",
    label = "Choose a state",
<<<<<<< HEAD
    choices = c("CA", "WA", "NY", "FL" ))
=======
    choices = summary_df$state )
>>>>>>> b242a8758d78197832813e0a2d2b979ea92bc05b
)

sum_graph <- mainPanel(
  plotlyOutput("sum_plot")
)

summary_panel <- tabPanel(
  "Summary",
<<<<<<< HEAD
  titlePanel("Key Takeaways"),
 p("1 key takeways de "),
 p("2 key takeways de "),
 p("3 key takeways de ")
  
   #sidebarLayout(
    #summary_sidebar, 
    #sum_graph
  #)
=======
  titlePanel("coc pop of each state"),
  sidebarLayout(
    summary_sidebar, 
    sum_graph
  )
>>>>>>> b242a8758d78197832813e0a2d2b979ea92bc05b
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
<<<<<<< HEAD
=======
    
>>>>>>> b242a8758d78197832813e0a2d2b979ea92bc05b
