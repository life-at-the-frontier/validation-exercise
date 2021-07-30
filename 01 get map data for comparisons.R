# 01. Make maps for each pair -------------------------------------------------

##  Note: maps are now thirds Q = top third
# mapA <- #Qs 1
# mapB <- #Qs 2
# mapC <- #Qs 3


# input/ output -----------------------------------------------------------

## input: 
## Base only if we can to map prop Foreigners
# shefBase_Here <- 
#   'cleaned data/makeFile01 sheffield ttwa lsoa.rds'

shefBorders_Here <-
  'cleaned data/makeFile01 sheffield borders+frontiers.rds'



# 1. read in the data -----------------------------------------------------
# 
# shef_sf <-
#   shefBase_Here %>% readRDS

shef_borders <-
  shefBorders_Here %>% readRDS


# issue: duplciated borders -----------------------------------------------
shef_borders  %>% head ## see lines 4-6

st_geometry(shef_borders) <- NULL

checkThis <- 
  shef_borders %>% group_by(id, id.1) %>% summarise( n = n())
checkThis %>% nrow
shef_borders  %>% nrow

## Add percentile ranks

shef_borders <-
  shef_borders %>%
  arrange(std_diff_phi) %>%
  mutate(
    rank = ntile(std_diff_phi, 100)
  )

# 2. Pick a centrePoint ---------------------------------------------------


ukgrid = "+init=epsg:27700"

#Find coord for S61 1LZ
##  example code for check postcode
# pcd_df <- read.csv('temp data/NSPL_FEB_2020_UK/Data/NSPL_FEB_2020_UK.csv')
# pcd_df %>% head
# pcd_df$pcd %>% grep('S61 1LZ', x = .) #1981275
# pcd_df$oseast1m[1981275] #441515
# pcd_df$osnrth1m[1981275] #393038


##  Find coordinates of postcode point to centre
# Centre of Masborough, Henley and Ferham = S61 1LZ
S61_1LZ <- 
  c(441515, 393038)
###Centre of Kimberworth = S61 1PB
S61_1PB <-
  c(440243, 393689)
###Centre of Crookes = S10 1TE
S10_1TE <-
    c(432798, 387752)
##  Sheff uni = S10 2TN
shef_uni <-
    c(434120, 387290)
# RUCT =  S60 1AH
RUCST <-
    c(442732, 392677)


##  Create gis obj for centre
centrePoint <-
  st_point(
    S61_1LZ
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

# 3. subset borders and make xtiles ---------------------------------------

rel_borders <-
  shef_borders %>%
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
