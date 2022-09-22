# 01. Make maps for each pair -------------------------------------------------

##  Note: maps are now thirds Q = top third
# mapA <- #Qs 1
# mapB <- #Qs 2
# mapC <- #Qs 3


# input/ output -----------------------------------------------------------

## input: 
## Base only if we can to map prop Foreigners

## fill these fields in:

cityName <- 
  'sheffield'
#  'malmo1'

cityBorders_Here <-
   'cleaned data/makeFile01 sheffield borders+frontiers.rds' #used for sheffield



# 1. read in the data -----------------------------------------------------
# 
# shef_sf <-
#   shefBase_Here %>% readRDS

cityBorders <-
  cityBorders_Here %>% readRDS

## Add percentile ranks

cityBorders <-
  cityBorders %>%
  arrange(std_diff_phi) %>%
  mutate(
    rank = ntile(std_diff_phi, 100)
  )

# 2. Pick a centrePoint ---------------------------------------------------



## Trial here:
##  Find coordinates of postcode point to centre
#  example: Centre of Masborough, Henley and Ferham = S61 1LZ

useCRS = 
  "+init=epsg:27700" ## Ukgrid

thisPoint <- 
  c(441515, 393038) ###Centre of Kimberworth = S61 1PB

##  Create gis obj for centre
centrePoint <-
  st_point(
    thisPoint
  )

centrePoint <-
  centrePoint %>%
  st_sfc(
    crs = st_crs(useCRS)
  )

# buffer point ------------------------------------------------------------

centrePoint <-
  centrePoint %>% 
  st_buffer(1500)

centrePoint %>% qtm

# 3. subset borders and make xtiles ---------------------------------------

rel_borders <-
  cityBorders %>%
  st_intersection(centrePoint)

rel_borders 
# create xtile group based on std_diff_phi 
##  See ntile for making quartiles, thirds etc
rel_borders <-
  rel_borders %>%
  arrange(std_diff_phi) %>%
  mutate(
    xtile_rel = ntile(-std_diff_phi, 3) 
  )

## Check statistics
rel_borders$length <-
  rel_borders %>% st_length()

##  Summaries; Q1 = highest percentile group
rel_borders %>% 
  group_by(xtile_rel) %>%
  select(std_diff_phi:length, - geometry) %>%
  summarise_all( mean ) 

# other stats
rel_borders %>% 
  as.data.frame() %>%
  group_by(xtile_rel) %>%
  select(std_diff_phi:length) %>%
  summarise_if( is.numeric, max ) 


rel_borders %>% summary ## check for the stat vs the random map


# 4. create map data  -------------------------------------------------------

mapA <- #Qs 1
  rel_borders %>%
  filter(
    xtile_rel %in% c(1)
  ) 

mapB <- #Qs 2
  rel_borders %>%
  filter(
    xtile_rel %in% c(2)
  ) 

mapC <- #Qs 3
  rel_borders %>%
  filter(
    xtile_rel %in% c(3)
  ) 

# mapD <- #Qs 4
#   rel_borders %>%
#   filter(
#     xtile_rel %in% c(4)
#   ) 
# 
# mapE <- #Qs 1&3
#   rel_borders %>%
#   filter(
#     xtile_rel %in% c(1, 3)
#   ) 


# End. save maps ---------------------------------------------------------------
mapdataList <-
  list(
    a = mapA,
    b = mapB,
    c = mapC,
#    d = mapD#,
#    e = mapE
    centrePoint = centrePoint
  )


mapdataList %>% saveRDS('cleaned data/01 data for trial maps.rds')
