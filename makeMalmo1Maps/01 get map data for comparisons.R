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
#  'sheffield'
  'malmo1'

cityBorders_Here <-
  # 'cleaned data/makeFile01 sheffield borders+frontiers.rds' #used for sheffield
  'cleaned data/makeFile03 malmo borders+frontiers.rds'


# 1. read in the data -----------------------------------------------------
# 
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
#  "+init=epsg:27700" ## Ukgrid
#  "+init=epsg:3006" ## sweden?
'+init=epsg:4326' ## google earth longlat

st_crs(useCRS) == st_crs(cityBorders)

# The two alternative areas are the same as I already wrote about: 
# on the Lorenborgsgatan (Hyllie, Krokbäck, Bellevuegården) and  
# on the Inre Ringvägen between Rosengård and Videdal. Ask me for greater detail, if needed.
##hospital or ICA supermarket
## inre ringvagen -- rosengardklikin hospital

thisPoint <- 
#  c(441515, 393038) ###Centre of Kimberworth = S61 1PB
  c(12.97675485643831, 55.58121116338579) #ICA Supermarket Bellvuegården, longlat; malmo1 centre


##  Create gis obj for centre
centrePoint <-
  st_point(
    thisPoint
  )

centrePoint <-
  centrePoint %>%
  st_sfc(
    crs = st_crs(useCRS)
  ) %>% 
  ## transform to same CRS as the borders map 
  st_transform(
    crs = st_crs(cityBorders)
  )

# buffer point ------------------------------------------------------------
## nuffer using easting norting crs
centrePoint <-
  centrePoint %>% 
  st_buffer(1500)

tmap_mode('view')
centrePoint %>% qtm(alpha = 0.2)

# 3. subset borders and make xtiles ---------------------------------------

## check maps frontiers 
cityBorders %>%
  filter(std_diff_phi > 1) %>%
  qtm

## so basically they have chosen an area with just one frontier: the road, 
##  can't really pull to many trick hers

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
  select(std_diff_phi:length) %>%
  summarise_all( mean ) 


# others
rel_borders %>% 
  group_by(xtile_rel) %>%
  select(std_diff_phi:length) %>%
  summarise_if( is.numeric, max ) 

rel_borders %>% 
  group_by(xtile_rel) %>%
  select(std_diff_phi:length) %>%
  summarise_if( is.numeric, min ) 



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
