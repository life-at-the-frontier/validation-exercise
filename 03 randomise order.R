##  0x Create a random order and save it 

##  1. How many sets of experiments 
nSets <- 25
nPairs <- 3


##  2. For loop to generate each set

setList <- 
  list(NULL)

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

# Output: trial order -----------------------------------------------------
setTable <- 
  setList %>% bind_rows()

## save the randomised order
setTable %>% 
  saveRDS(
    'cleaned data/secret map order.rds'
  )

##  save the digitial spreadsheet
setTable %>% 
  select(set, seenOrder, result) %>%
  write.csv(
    'docs/fillable results sheet.csv',
    row.names = F
  )

