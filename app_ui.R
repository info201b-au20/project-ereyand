# Project web page Final Deliverable

# Load necessary packages
library(shiny)
library(tidyverse)
library(ggplot2)
library(plotly)

source("app_server.R")

# create introduction page
intro_panel <- tabPanel(
  "Introduction",
  p("We will be discussing and analyzing the people experiencing homelessness
    in the United States primarily focusing in key states throughout out the 
    nation. We decided to emphasize data collected from the states of 
    Washington, California, Florida and New York since these states are located
    in each corner of the country."),
  p("We will be exploring the field/domain of homelessness in order to humanize
    the homeless population that is ever so present yet invisible to our society
    . One of the reasons we decided to dedicate our project to this topic is to 
    create empathy for those suffering from it."),
  p("At the same time, we would like to be responsible with our data and not 
      reduce our subject to their conditions, which is why we are committed to 
      researching their interpersonal conditions.")
)

# create first chart page
x_data <- all_homeless_wa %>% 
  select(sheltered_total_homeless_individuals, 
         sheltered_total_homeless_people_in_families, sheltered_homeless, 
         sheltered_total_homeless_veterans, 
         sheltered_total_homeless_unaccompanied_youth_under_25)
x_col_names <- colnames(x_data)

y_data <- all_homeless_wa %>% 
  select(unsheltered_homeless, unsheltered_homeless_individuals, 
         unsheltered_homeless_veterans, unsheltered_homeless_people_in_families,
         unsheltered_homeless_unaccompanied_youth_under_25)
y_col_names <- colnames(y_data)

featurex_input <- selectInput(
  inputId = "feature",
  label = "Select a feature",
  choices = x_col_names,
  selected = "sheltered_homeless"
)
featurey_input <- selectInput(
  inputId = "featuretwo",
  label = "Select a feature",
  choices = y_col_names,
  selected = "unsheltered_homeless"
)

first_panel <- tabPanel(
  "Chart 1",
  titlePanel("Homelessness in Washington"),
  featurex_input,
  featurey_input,
  plotOutput("plot_one"),
  p("Our first chart.")
)

# create second chart page
second_panel <- tabPanel(
  "Chart 2",
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
  
  checkboxInput("smooth", label = strong("Show Trendline"), value = FALSE),
  checkboxInput("smooth", label = strong("Show Trendline"), value = FALSE)
)
main_content <- mainPanel(
  plotlyOutput("fl_plot"),
  plotlyOutput("ny_plot"),
  
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
  "Chart 3",
  titlePanel("Homeless Veterans in the East Coast"),
  sidebarLayout(
    side_content,
    main_content
  )
)

# create summary page
summary_sidebar <- sidebarPanel(
  p("State"),
  selectInput( 
    inputId = "states",
    label = "Choose a state",
    choices = c("CA", "WA", "NY", "FL" ))
)

sum_graph <- mainPanel(
  plotlyOutput("sum_plot")
)

summary_panel <- tabPanel(
  "Summary",
  titlePanel("Key Takeaways"),
  p("It is evident from all charts that the overall homeless population is a growing problem that is nation wide.
    In focusing our scope of analysis on the homeless veteran population we are able to gain insight onto the reasons for displacement
    and how lack of support for the veteran population and extending to the mentally ill population, has exacerbated the homeless problem in America"),
  p("We can also see from the chart that the capacity for housing the homeless does not meet the number of homeless veterans; 
    it can then be deduced that either the support systems for veterans need reform or that housing and shelter resources for
    the homeless need expansion"),
  p("Key Takeaway 3")
  
  #sidebarLayout(
  #summary_sidebar, 
  #sum_graph
  #)
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