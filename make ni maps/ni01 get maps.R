# 01. Make maps for each pair -------------------------------------------------

##  Note: maps are now thirds Q = top third
# mapA <- #Qs 1
# mapB <- #Qs 2
# mapC <- #Qs 3


# input/ output -----------------------------------------------------------

## input: 
## Base only if we can to map prop Foreigners

derryBorders_Here <-
  'cleaned data/makeFile02 derry borders+frontiers.rds'

# 1. read in the data -----------------------------------------------------
# 
# derry_sf <-
#   shefBase_Here %>% readRDS

derry_borders <-
  derryBorders_Here %>% readRDS

## Add percentile ranks

derry_borders <-
  derry_borders %>%
  arrange(std_diff_phi) %>%
  mutate(
    rank = ntile(std_diff_phi, 100)
  )




# 1.1 convert map to ukgrid -----------------------------------------------

ukgrid = "+init=epsg:27700"

derry_borders <-
  derry_borders %>% 
  st_transform(crs = st_crs(ukgrid))

# [Check]
tmap_mode('view')
derry_borders %>% qtm


# 2. Pick a centrePoint ---------------------------------------------------




#Find coord for S61 1LZ
##  example code for check postcode
# pcd_df <- read.csv('temp data/NSPL_FEB_2020_UK/Data/NSPL_FEB_2020_UK.csv')
# pcd_df %>% head
# pcd_df$pcd %>% grep('S61 1LZ', x = .) #1981275
# pcd_df$oseast1m[1981275] #441515
# pcd_df$osnrth1m[1981275] #393038

# chapel school
chapel_school <- c(060602, 579066) ## too close to river??


##  Find coordinates of postcode point to centre


##  Create gis obj for centre
centrePoint <-
  st_point(
    chapel_school
  )

centrePoint <-
  centrePoint %>%
  st_sfc(
    crs = st_crs(ukgrid)
  )

# buffer point ------------------------------------------------------------

centrePoint <-
  centrePoint %>% 
  st_buffer(1500)

centrePoint %>% qtm
# cover a considerable spot.

# 3. subset borders and make xtiles ---------------------------------------

rel_borders <-
  derry_borders %>%
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


mapdataList %>% saveRDS('cleaned data/ni01 data for trial maps.rds')
