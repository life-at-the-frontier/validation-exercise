##  Example xx save tmap to folder 


# 1. Create directory to save ---------------------------------------------

map.dir <- 
  'output maps'

dir.create(
  map.dir
)


# 2. Read in map (and maybe randomise here?) ------------------------------

pairMapList <- readRDS('cleaned data/Quartile maps saved.rds')

mapOrder <- 
  1:4

randPairs <- pairMapList[mapOrder]

## save the randomised order
randPairs %>% 
  saveRDS(
    map.dir 
    %>% file.path('random map pairs.rds')
    )


##  Save order 
mapOrder %>% write.csv(
  map.dir %>% file.path('map order.csv')
)

# 3. Second try == render in Rmarkdown 

rmarkdown::render(
  map.dir %>% file.path("renderPair1.Rmd"), 
  params = list())

rmarkdown::render(
  map.dir %>% file.path("renderPair2.Rmd"), 
  params = list())

rmarkdown::render(
  map.dir %>% file.path("renderPair3.Rmd"), 
  params = list())

rmarkdown::render(
  map.dir %>% file.path("renderPair4.Rmd"), 
  params = list())


#