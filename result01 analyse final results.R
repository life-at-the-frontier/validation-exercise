## report01:Analyse the results 


# input/output ------------------------------------------------------------

library(tidyverse)

# read the data -----------------------------------------------

result_df <-
  read_csv('cleaned data/makeFile03 cleaned experiment data.csv')

## mapA_position is the location of the algo predicted higher borders
##  The maps are divided in tertiles: A, B ,C (A = highest frontier)
## The pairs compare: 
##  1: A vs B
##  2: A vs C 
##  3: B vs C

# 0. omit cases where the respondent did not pass initial prelim exercise -----
noPrelim <- c('RES_UK_R_23')

result_df <-
  result_df %>%
  filter(
    !(interview_id %in% noPrelim)
    )

# 1. analysis -------------------------------------------------------------

## Estimate the the aggrement rate 

nCases <- result_df$interview_id %>% unique %>% length ## number of participants

## Calculate the pvalue from a binomial dist with prob = 50% 
pVal_binom <-
  function(nSuccess, nTrials){
    1 - 2 * abs(0.5 - pbinom(nSuccess, nTrials, prob = 0.5))
    }

agreement_df <-
  result_df %>%
  group_by(realPair) %>%
  summarise(
    n = n(),
    agreeN = sum(mapA_position == result),
    agreeRate = agreeN / n 
    )

agreement_df <-
  agreement_df %>%
  mutate(
    se = sqrt(0.25/ n), 
#    p.value = 2 * ( 1 - abs(agreeRate - 0.5) %>% pnorm(sd = se) ), #based on the normal distribution
    p.value = pVal_binom(agreeN, n) #based on the actual binomial dist 
    )

# 2. check other stats -------------------------------------------------------

## sequence 
sequence_df <-
  result_df %>%
  group_by(seenOrder) %>%
  summarise(
    agreeN = sum(mapA_position == result),
    disagreeN = sum(mapA_position != result),
    agreeRate = agreeN / (agreeN +  disagreeN)
  )

sequence_df ## i.e. does right answers change with the seen order 

sequence_df %>%
  select(agreeN, disagreeN) %>%
  fisher.test()

## order -------------------------------------------

result_df$mapA_position %>% table ## half the time the right map was on lhs
## the data is random with respect to order 
order_df <- 
  result_df %>%
  group_by(realPair) %>%
  summarise(
    result1 = sum(result == 1),
    result2 = sum(result == 2),
    )## pretty much 50 - 50
##

order_df %>%
  select(result1, result2) %>%
  fisher.test()

## No ordering effects

## aggreement over time ----------------------------------------
## split the data into two halves 

timing_df <-
  result_df %>%
  mutate(
    splitTime = cut(chronological_id, 2)
    ) %>%
  group_by(splitTime) %>%
  summarise(
    agreeN = sum(mapA_position == result),
    disagreeN = sum(mapA_position != result)
  )


timing_df %>% 
  select(agreeN, disagreeN) %>%
  fisher.test()

## done. 
## No changes in agreement over time