# summary information w/values
# Dataset with Alabama homelessness population
library(tidyverse)
library(stringr)

# load the dataset
alabama <- read.csv("https://raw.githubusercontent.com/info201b-au20/project-ereyand/gh-pages/panel_2_table_and_counts_v7_2020_03_27.csv")

# view it
# Number of observations in dataset
obs_alabama <- nrow(alabama)

# Number of features in dataset
num_features_alabama <- ncol(alabama)

