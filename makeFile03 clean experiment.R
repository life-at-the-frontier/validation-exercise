# makeFile03: Clean the original data and attach to the map order 


# input -------------------------------------------------------------------

library(tidyverse)
library(lubridate)

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


# convert durations to seconds --------------------------------------------
## we use lubriate to extract time from a hms class 
names(result_df)
result_df ## duration1 = total start and end time; duration2 =  time from map 1 to end

convertToSecs <-
  function(durationStr){
    minute(durationStr)*60 + ## minutes
      second(durationStr) #seconds
    }

convertToMinutes <-
  function(durationStr){
    hour(durationStr)*60 + ## minutes
      minute(durationStr) #seconds
  }

result_df <-
  result_df %>%
  mutate(
    duration1 = duration1 %>% convertToSecs(),
    duration2 = duration2 %>% convertToSecs(),
    start_time_pe = start_time_pe %>%  convertToMinutes()
  ) %>%
## Set zero duration to NA
  mutate(
    duration1 = ifelse(duration1 == 0, NA, duration1),
    duration2 = ifelse(duration2 == 0, NA, duration2),
    start_time_pe = ifelse(start_time_pe == 0, NA, start_time_pe)
    )

# order by date and add in order index ------------------------------------
result_df <-
  result_df %>%
  mutate(
    date = date %>% as.Date('%d/%m/%Y')
    )

date_order <-
  result_df %>%
  group_by(interview_id) %>%
  arrange(date) %>%
  summarise(
    chronological_id = NA
  )

date_order$chronological_id = 1:nrow(date_order)

result_df <-
  result_df %>%
  left_join(date_order)

## Reorder some cols for easier checking ------------------------------------
result_df <-
  result_df %>% 
  relocate(
    interview_id, chronological_id,  
    set,
    seenOrder,
    realPair,
    result,
    mapA_position,
    start_time_pe,
    duration1
           )
 
# save output -------------------------------------------------------------

result_df %>%
  write_csv('cleaned data/makeFile03 cleaned experiment data.csv')

