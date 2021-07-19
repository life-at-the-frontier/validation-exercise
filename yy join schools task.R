library(tidyverse)
library(data.table)



# 1. Load in data ---------------------------------------------------------

master_df <- 
  read.csv('temp data/Master Dataset.csv')

schools_df <-
  read.csv('cleaned data/england_school_information 2018.csv')


# school performance data -------------------------------------------------
ks4_df <-
  read.csv(
    'cleaned data/england_ks4final.csv'
  )

ks4_df <-
  ks4_df %>%
  select(
    URN, ESTAB, LEA, ATT8SCRMAT
  )

# 2. join school ks4 info -----------------------------------
schools_df %>%
  left_join(ks4_df)

## but duplicated

schools_df %>% head

schools_df %>%
  left_join(
    ks4_df,
    by = c(ï..URN = 'URN')
    )

# Task: join schools to postcode data (and also imd rank) ------------
##  you can use cor() to find the correlation between imd rank ks4 outcomes (see ?cor on what to do with missing data)


