# 'Wrangling' big data 

## 
onsPostcodes_here <- 
  'temp data/ons postcode lookup/NSPL_FEB_2020_UK.csv'

##  This will take ages
postcode_df <- 
  read.csv(onsPostcodes_here)

?read.csv
## nrows tells us the max number of rows to read in
postcode_df <- 
  read.csv(onsPostcodes_here, 
           nrows = 100)

head(postcode_df)

## however it's better to choose a different package dedicated to big data 
library(data.table)

## fread = fast read ?
?fread
postcode_df <-
  fread(onsPostcodes_here, 
        nrows = 10 # same command to read 10 rows
        )

postcode_df ## works

## exact onl the info we need; example coordinates and pcd 
postcode_df <-
  fread(
    onsPostcodes_here,
    select = c('pcd', 'oseast1m', 'osnrth1m', 'lsoa11', 'imd')
  )

## all done
postcode_df 
class(postcode_df)
dim(postcode_df) ## we know it has 2.6 mil plus rows and 3 cols

object.size(postcode_df) /1e6




# saving R objects --------------------------------------------------------

## saveRDS and readRDS
?saveRDS
saveRDS(1:10, file = 'cleaned data/example.rds')

outAgain <- 
  readRDS('cleaned data/example.rds')
outAgain


# piping function ---------------------------------------------------------
library(tidyverse)
saveRDS(1:10, file = 'cleaned data/example.rds')

# %>% sends the object on the left hand side to the first argument on the rhs
# makes things look infinitely clearer
1:10 %>% saveRDS(file = 'cleaned data/example.rds')

postcode_df %>% class
postcode_df %>% class 

# use ?function to check which is the first argument 
?class 

##  We can change the default behaviour and send the object to a different argument using argument = .
?saveRDS
'cleaned data/example.rds' %>% saveRDS(1:10, file = .)




# manipulating datasets ---------------------------------------------------
postcode_df

## mutate creates new variables
postcode_df %>%
  mutate(
    higherEasting = oseast1m + 100,
    pcd1 = pcd %>% substr(1, 1)
  )

##  rename renames variables
postcode_df %>%
  rename(
    higherEasting = oseast1m
  )

## group_by groups the dataset by a variable or variables ....
postcode_df %>%
  group_by(lsoa11)


### ...useful for calculating grouped derived stats ...
postcode_df %>%
  group_by(lsoa11) %>%
  mutate(
    pcdInLSOA = lsoa11 %>% length
  )

## .. or summarising using summarise
postcode_df %>%
  group_by(lsoa11) %>%
  summarise(
    pcdWeightedEasting = oseast1m %>% mean,
    pcdWeightedNorthing = osnrth1m %>% mean
  )

## select()
postcode_df %>%
  select(oseast1m)

postcode_df %>%
  select(oseast1m, osnrth1m)

postcode_df %>%
  select(
    starts_with('os')
  )

postcode_df %>%
  select(
    -oseast1m
  )

postcode_df %>%
  select(
    pcd:osnrth1m
  )


## remember to save your changed data.frame as an object if you want to keep it!

# manipulating strings ----------------------------------------------------
postcode_df %>% head

exampleString <- 
  'AB1 0AA'

## find string length: nchar
exampleString %>% nchar

# Reading in multiple files -----------------------------------------------
multiFiles_here <-
  'temp data/ons postcode lookup/multi_csv/'

list.files(multiFiles_here)

## get all file names 
fileNames <- 
  list.files(multiFiles_here)

##  paste sticks 2 strings together, paste0 sticks them together without a space 
paste('stuck', 'together')
paste0('stuck', 'together')

long_filePath <-
  paste0(multiFiles_here, fileNames)



## Check results
long_filePath 
long_filePath[1]

read.csv(long_filePath[1])
fread(long_filePath[1],
      select = c('pcd', 'oseast1m', 'osnrth1m', 'lsoa11', 'imd')
        )

## forLoop

## example 
for (loop_i in 1:10){
  print( 0 + loop_i)
}



## for files
howManyFiles <- 
  length(long_filePath)

for (loop_i in 1:2){
  filePath_i <- long_filePath[loop_i]
  
  extractedDF_i <-
    fread(filePath_i,
        select = c('pcd', 'oseast1m', 'osnrth1m', 'lsoa11', 'imd')
  )
  
  print(extractedDF_i)
}

##  But this reads it in but saves it nowhere, we need to create a place for R to save it
##  lists = generic list of objects 
## initialise it 

saveHere_list <-
  list(NULL) ##make a list with no (null) objects

##  We can fill up the items on a list as we go along
saveHere_list
saveHere_list[2] <- 1 ## use double square brackets for indexing lists
saveHere_list
saveHere_list[6] <- 'overhere' 
saveHere_list

## For now we are going to use that forloop again to create a list of data.frames
howManyFiles <- 
  length(long_filePath)

for (loop_i in 1:howManyFiles){
  filePath_i <- long_filePath[loop_i]
  
  extractedDF_i <-
    fread(filePath_i,
          select = c('pcd', 'oseast1m', 'osnrth1m', 'lsoa11', 'imd')
    )
  
  saveHere_list[[loop_i]] <-
    extractedDF_i
}

## has it worked?
saveHere_list

##  Now to combine all the dataframes in this list into one data.frame

rbindlist(saveHere_list) #done!

