library(tidyverse)
library(data.table)



# 1. Load in data ---------------------------------------------------------
#look at variables
master_df <- 
  read.csv('temp data/Master Dataset.csv', nrows = 2)

master_df

schools_df <-
  read.csv('cleaned data/england_school_information 2018.csv', nrows = 2)

schools_df

postcode_df <- read.csv('temp data/NSPL_FEB_2020_UK/Data/NSPL_FEB_2020_UK.csv', 
                        nrows = 5)

postcode_df

ks4_df <-
  read.csv(
    'cleaned data/england_ks4final.csv', nrows = 5)

ks4_df

#load data and drop variables
master_df <- 
  read.csv('temp data/Master Dataset.csv')

schools_df <-
  read.csv('cleaned data/england_school_information 2018.csv')

postcode_df <- fread('temp data/NSPL_FEB_2020_UK/Data/NSPL_FEB_2020_UK.csv')

postcode_df <- postcode_df %>%  
  select(pcd, pcd2, pcds, oseast1m, osnrth1m, lsoa11, imd)

ks4_df <-
  read.csv(
    'cleaned data/england_ks4final.csv'
  )

ks4_df <-
  ks4_df %>%
  select(
    URN, ESTAB, LEA, ATT8SCRMAT
  )

#Join KS4 data
schools_df %>%
  left_join(ks4_df)

## but duplicated

schools_df %>% head

sch_ks4 <- schools_df %>%
  left_join(
    ks4_df,
    by = c(ï..URN = 'URN')
  )

#Join postcode data
sch_ks4_pcd <- sch_ks4 %>% left_join(postcode_df,
                        by = c(POSTCODE = 'pcds'))

sch_ks4_pcd %>% head

filter(sch_ks4_pcd, is.na(lsoa11))

#collpase master_df to get avg for each LA
master_df %>% head

master_df <- 
  read.csv('temp data/Master Dataset.csv')

master_summ <- master_df %>% 
  group_by(lacode, laname) %>%
  summarise_if(is.numeric, mean, na.rm = TRUE)

#join master_summ to sch_ks4_pcd
final_df <- sch_ks4_pcd %>%
  left_join(master_summ, 
            by = c(LANAME = 'laname'))
final_df %>% head

# Task: join schools to postcode data (and also imd rank) ------------
##  you can use cor() to find the correlation between imd rank ks4 outcomes (see ?cor on what to do with missing data)

?cor
final_df

cor(imd, ATT8SCRMAT, use = "complete.obs", method = c("pearson"))

#collpase master_df to get avg for each LA
master_df %>% head

# -------------------------------------------------------------------------

##  forLoop

for (loop_i in 1:10){
  
  loop_i #change
  
  print(loop_i)
}


values_for_each_loop <- 1:10
for (loop_i in values_for_each_loop){
  
  print(1)
}

## allocate somewhere to put results -- lists
result_list <-
  list()

# result_list[[1]] <- 1
# result_list[[100]] <- 1


values_for_each_loop <- 1:10

for (loop_i in values_for_each_loop){
  result_list[[loop_i]] <- loop_i
}

result_list %>% unlist


# -------------------------------------------------------------------------

# Q. Can you read in all the multi_csv postcode files ---------------------

# Hint: use lists, forloops, and a function that lists all files in a directory
# You may also require paste; a function that sticks 2 strings together
my_path <- "temp data/NSPL_FEB_2020_UK/Data/multi-csv"
postcode_multicsv <- list.files(pattern = "*.csv")

postcode_multicsv %>% lapply(for loop_i)

