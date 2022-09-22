## report01:Analyse the results 


# input/output ------------------------------------------------------------

library(tidyverse)


# create fake data (result_df) -----------------------------------------------


nSets <- 25
nPairs <- 3

setList <- list(NA)
for (set_i in 1:nSets){
  
  mapA_position <-
    sample.int(2, nPairs, replace = T)
  
  pair_order <- 
    sample.int(nPairs, nPairs)
  
  setList[[set_i]]<-
    data.frame(
      set = set_i,
      seenOrder = 1:3,
      realPair = pair_order,
      mapA_position = mapA_position,
      result = NA
    )
  
}

result_df <-
  setList %>% bind_rows()

result_df$result <- sample.int(2, result_df %>% nrow(), replace = T)


# 1. analysis -------------------------------------------------------------

## Estimate the the aggrement rate 

nCases <- result_df$set %>% unique %>% length ## number of participants

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
    p.value = 2 * ( 1 - abs(agreeRate - 0.5) %>% pnorm(sd = se) )
    )

0.5 - sqrt(0.25/ 25) * 1.96
 

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

sequence_df

sequence_df %>%
  select(agreeN, disagreeN) %>%
  fisher.test()

## order 

order_df <-
  result_df %>%
  group_by(mapA_position) %>%
  summarise(
    result1 = sum(result ==1),
    result2 = sum(result ==2)
  )

order_df
order_df %>%
  select(result1, result2) %>%
  fisher.test()

## aggreement over time 
## split the data into two halves 

timing_df <-
  result_df %>%
  mutate(splitTime = set > nCases/2) %>%
  group_by(splitTime) %>%
  summarise(
    agreeN = sum(mapA_position == result),
    disagreeN = sum(mapA_position != result)
  )

timing_df
timing_df %>% 
  select(agreeN, disagreeN) %>%
  fisher.test()

## done. 
