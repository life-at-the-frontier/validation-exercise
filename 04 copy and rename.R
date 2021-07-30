## 0x could we simply just copy and rename the maps we use 



# input: specify folders --------------------------------------------------

origMaps_dir <-
  'output pair alternatives'

trialMaps_dir <-
  'rotherham experiment maps'

##  How many sets of experiments  -- copy from 03
nSets <- 25
nPairs <- 3

##  which secret map order (use script 03)

thisMapOrder <-
  'cleaned data/map order 2021-07-30.rds'

##  where's the prelim exercise?
prelimTask_here <-
  file.path(
    origMaps_dir,
    'Preliminary-Exercise.html' 
  )




# 1. Load set order + initialise folders ----------------------------------

## load in the set order
setTable <- 
  thisMapOrder%>% 
  readRDS


## create the trial folder
trialMaps_dir %>% dir.create()
  
## save the fillable form in the dir
setTable %>% 
  select(set, seenOrder, result) %>%
  write.csv(
    file.path(trialMaps_dir, 'fillable results sheet.csv'),
    row.names = F
  )

## save the map order original name 
cat(thisMapOrder, 
    file = file.path(trialMaps_dir, "order ID.txt")
    )


# 2. add the filename for the pair maps to be extracted --------------

setTable <-
  setTable %>%
  mutate(
  choose_files =
  paste0('pair', realPair, '_', mapA_position, '.html'),
  rename_to = 
    paste0('pair', seenOrder, '.html')
)

# 3. Now to create the routine to create the files in the folders -------

for (set_i in 1:nSets){
  set_i_dir <-
    file.path(trialMaps_dir, set_i)
  
  set_i_table <-
    setTable %>%
    filter(set == set_i)
  
  ## create dir
  set_i_dir %>% dir.create()

  ## Place the prelim exercise into each place 
  file.copy(
    from = prelimTask_here,
    to = set_i_dir,
    overwrite = T
  )

  
  ## Copying the maps and randomising
  ## locations  
  set_i_copyThese <- 
    file.path(
      origMaps_dir,
      set_i_table$choose_files
    )
  
  set_i_saveHere <- 
    file.path(
      set_i_dir,
      set_i_table$choose_files
    )
  
  set_i_renameTo <- 
    file.path(
      set_i_dir,
      set_i_table$rename_to
    )
  
  ## Now to run the copy + rename
  
  file.copy(from = set_i_copyThese, 
            to = set_i_dir,
            overwrite = T)
  
  file.rename(
    from = set_i_saveHere, 
    to = set_i_renameTo
    )
  
  ## print to check everything has worked
  print(set_i)
  print(set_i_renameTo %>% file.exists)
}


### End