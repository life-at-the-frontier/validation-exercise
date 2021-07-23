##  Example xx save tmap to folder 


# 1. Create directory to save ---------------------------------------------

dir.create(
  'map pairs'
)


# 2. Read in map (and maybe randomise here?) ------------------------------

pairMapList <- readRDS('cleaned data/Quartile maps saved.rds')

mapOrder <- 1:4


# 3 save --------------------------------------------------------

## first map
# pairMapList[[ mapOrder[1] ]] %>% 
#   tmap_save('map pairs/pair1.html')
## Doesn't work 

## known tmap problem -- you can't save facetted synced mapos even if you can export them in R

pairMapList[[ mapOrder[1] ]] %>% leaflet::leaflet()
pairMapList[[ mapOrder[1] ]] %>% tmap_leaflet() %>% htmlwidgets::saveWidget('test.html')
