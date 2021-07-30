## 0x could we simply just copy and rename the maps we use 



# input: specify folders --------------------------------------------------

origMaps_dir <-
  'output pair alternatives'

trialMaps_dir <-
  'maps for experiment'

##  How many sets of experiments  -- copy from 03
nSets <- 25
nPairs <- 3


# 1. Load set order + initialise folders ----------------------------------

## load in the set order
setTable <- 'cleaned data/secret map order.rds' %>% readRDS

## create the trial folder
trialMaps_dir %>% dir.create()
  

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
  set_i_dir %>% dir.create(show)


  
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