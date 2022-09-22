# makeFile03: Clean the original data and attach to the map order 


# input -------------------------------------------------------------------

library(tidyverse)

result_df <-
  read_csv('cleaned data/experiment results.csv')

mapOrderDf <-
  readRDS(
    'cleaned data/map order 2021-08-03.rds'
  )

# code --------------------------------------------------------------------


result_df <- 
  result_df %>%
  left_join(
    mapOrderDf %>%
      select(-result)
  )

## Check for missingness 
result_df %>% summary

## unique ids: 
result_df$interview_id %>% table # check all had 3...
(result_df$interviewer %>% table)/3 # Check how many were done by whom
(result_df$set %>% table) / 3 ## okay so we can see set 1 was used 3 time as Henry and Aneta attest

# out %>%
#   group_by(realPair) %>%
#   summarise(
#     n = n(),
#     propCorrect = sum(result == mapA_position) 
#     )

# oh wow most could correct guess! so yes choosing Rho is more or less good


# save output -------------------------------------------------------------

result_df %>%
  write_csv('cleaned data/makeFile03 cleaned experiment data.csv')

