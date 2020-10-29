# Final Project
Use this `REAMDE.md` file to describe your final project (as detailed on Canvas).

# Domain of Interest
Why are you interested in this field/domain?

We are interested in this field/domain to humanize the homeless population that is ever so present yet invisible to our society. We want to show the inevitability and causes of homelessness and create empathy for those suffering from it. At the same time, we would like to be responsible with our data and not reduce our subject to their conditions, which is why we are researching their interpersonal conditions.

What other examples of data driven project have you found related to this domain (share at least 3)?

Fortunately, there's many organizations attempting to battle homelessness with data. One of them being the [National Alliance to End Homelessness](https://endhomelessness.org/homelessness-in-america/homelessness-statistics/state-of-homelessness-2020/) who has a visual representation showcasing the United States in its entirety. On this map, you can click on different states and read the data that was collected from it. Additionally, there is [Our World in Data](https://ourworldindata.org/homelessness) that has multiple data charts on its website that show the number of people experiencing homelessness in the United States, United Kingdom, and other countries around the world. Another example of data driven projects regarding homelessness was conducted by the [Washington Office of Superintendent of Public Instruction](https://www.k12.wa.us/student-success/access-opportunity-education/homeless-education/homeless-student-data-grant-recipients) that collected data regarding the amount of students experiencing homelessness in Washington state (you can check by county and district).


What data-driven questions do you hope to answer about this domain (share at least 3)?

  - We hope to answer the question of how mental health affects and/or causes homelessness; these two conditions have a symbiotic relationship and due to it we would like to analyze how these issues feed in to each other. We believe visual representation of accurate data will help guide communities towards humane and logical solutions to the epidemic that is homelessness.
  - A question we have regarding data and homelessness is if there's more men experiencing homelessness than women. Another question we wand to discuss is if data-driven conclusions are accurate in multiple countries; if it is true in the United States, is it also accurate in other countries?
  - Lastly, we hope to find data sets that can help us answer whether there's a higher proportion of people with mental illnesses experiencing homelessness.

# Finding Data
### Where did you download the data (e.g., a web URL)?

>Mayumi: I downloaded the data set of [Homelessness Data for Seattle/King County 1998-2020 from data.world](https://data.world/sasha/count-us-in-report-homelessness-data); this particular dataset was hosted by Sasha Anderson, and open to any organization who seek to use it. This is data set #1.

>Erica: I found two datasets that show the amount of women and men experiencing homelessness around the world since 1990. The first data set was retrieved through [GAPMINDER](https://www.gapminder.org/tools/?embedded=true#$state$marker$hook$which=female_long_term_unemployment_rate_percent&scaleType=linear&spaceRef:null;;;&chart-type=spreadsheet) that shows the female long term unemployment rate. The second data set was also retrieved through [GAPMINDER](https://www.gapminder.org/tools/?embedded=true#$state$marker$hook$which=female_long_term_unemployment_rate_percent&scaleType=linear&spaceRef:null;;;&chart-type=spreadsheet) which shows the male long term unemployment rate in multiple countries since 1990. These are datasets #2 and #3.

>Anush: I downloaded the dataset from [DATALAB](https://datalab.usaspending.gov/homelessness-analysis/#section-geography). The data is public and available to download. However, I would like to note that it was updated as of November 2019. This is data set #4.

>Jalen: I found a dataset regarding a Washington [D.C metropolitan area drug study](https://www.datafiles.samhsa.gov/study-dataset/washington-dc-metropolitan-area-drug-study-1991-homeless-and-transient-population-dc) on the homeless and transient community, with data focusing on mental health and mental health treatment. This is data set #5.

### How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?

>Mayumi: Data set #1 has an "About" summary of the host: "This dataset is compiled from the Count Us In yearly counts conducted by All Home, the lead agency for the Seattle/King County Continuum of Care. The Continuum of Care is responsible for providing data to the Department of Health and Human Services in order to be eligible to receive federal funding. This count is conducted on a single night in January of each year."

>Erica: Data sets #2 and #3 were collected by the [International Labour Organization](https://ilostat.ilo.org/) which has significant amount of ethos so the data is reliable. I believe the data was collected through confidential questionnaires in job locations therefore the audience are employees.

>Anush: The fourth data set was collected by DATALAB from the followinf sources:
  - Homeless Population by Region - [USAspending.dov](https://www.usaspending.gov/search), [Point-in-Time (PIT) Data](https://www.hudexchange.info/resource/3031/pit-and-hic-data-since-2007/)
  - Federal Programs that Address Homelessness
  - Comparing and Clustering Continuum of Care Areas

>Jalen: Data set #5 was taken from "Study Details": "The Homeless and Transient Population study examines the prevalence of illicit drug, alcohol, and tobacco use among members of the homeless and transient population aged 12 and older in the Washington, DC, Metropolitan Statistical Area (DC MSA)."


### How many observations (rows) are in your data?

>Mayumi: Data #1 has 24 rows in its landing page, but also more in different tabs containing information on reasons for displacement, services accessed, etc.

>Erica: Both data sets (#2 & #3) have 120 observations to indicate which country the percentage (element) belongs to and what year (features).

>Anush: The fourth data set has 400 observations (rows).

>Jalen: My dataset is unfortunately having issues being loaded into R, but from the study details, it details the following: "The Homeless and Transient Population study consisted of 908 interviews from four overlapping sampling frames: 477 interviews with residents in 93 shelters, 224 interviews with patrons of 31 soup kitchens and food banks, 143 interviews with "literally homeless" people from 18 major cluster encampments, and 64 interviews with literally homeless people from an area probability sample of 432 census blocks in the MSA. People who were cognitively impaired and could not complete the interview were excluded from the survey. Impairment was defined as extreme intoxification or scoring more than nine on the Short Blessed Exam (Katzman, Brown, Fuld, Peck, Schecter, and Schimmel, 1983)."

### How many features (columns) are in the data?

>Mayumi :There are 4 columns in the data's main page containing the basic information, though the data also contains multiple tabs with more specific information.

>Erica: Data sets #2 and #3 have 27 features to indicate which country the percentage (element) belongs to and what country (observation)

>Anush: Data #4 has 25 features (columns).

>Jalen: My dataset (#5) is unfortunately having issues being loaded into R, but from the study details, it details the following: "The Homeless and Transient Population study consisted of 908 interviews from four overlapping sampling frames: 477 interviews with residents in 93 shelters, 224 interviews with patrons of 31 soup kitchens and food banks, 143 interviews with "literally homeless" people from 18 major cluster encampments, and 64 interviews with literally homeless people from an area probability sample of 432 census blocks in the MSA. People who were cognitively impaired and could not complete the interview were excluded from the survey. Impairment was defined as extreme intoxification or scoring more than nine on the Short Blessed Exam (Katzman, Brown, Fuld, Peck, Schecter, and Schimmel, 1983)."

### What questions (from above) can be answered using the data in this dataset?

The first dataset can provide a basic foundation for analyzing the homeless population in King County, and answers questions of the factors leading to homelessness, as well as how much does mental health impact homelessness.

The second and third datasets can answer how many people (male or female) have experienced homelessness in 120 different countries in percentages/rate. We can utilize these data sets to answer which country has its citizens experience homelessness the most, what year this occurred, what country has the lowest rate of homeless citizens the past 27 years, the possibilities are endless.

The fourth dataset provides information about federal programs that address homelessness and provide funding.
