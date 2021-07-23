# 01. Make maps for each pair -------------------------------------------------

##  Note: maps are now thirds Q = top third
# mapA <- #Qs 1
# mapB <- #Qs 2
# mapC <- #Qs 3
# mapD <- # random map
# mapE <- #NA
# 


# input/ output -----------------------------------------------------------

## input
shefBase_Here <- 
  'cleaned data/makeFile01 sheffield ttwa lsoa.rds'

shefBorders_Here <-
  'cleaned data/makeFile01 sheffield borders+frontiers.rds'



# 1. read in the data -----------------------------------------------------

shef_sf <-
  shefBase_Here %>% readRDS

shef_borders <-
  shefBorders_Here %>% readRDS


##  Example maybe using 85% - 100% and 75% - 90% -- throws people off?
##  or 3 level add in 65% - 80%
##  We have 3 choices then so we sets of comparisons 3^1 choiceset

## Add percentile ranks

shef_borders <-
  shef_borders %>%
  arrange(std_diff_phi) %>%
  mutate(
    order = 1:nrow(shef_borders),
    rank = order / (nrow(shef_borders)) * 100
  )


###Centre of Masborough, Henley and Ferham = S61 1LZ

ukgrid = "+init=epsg:27700"

#Find coord for S61 1LZ
# pcd_df <- read.csv('temp data/NSPL_FEB_2020_UK/Data/NSPL_FEB_2020_UK.csv')
# pcd_df %>% head
# pcd_df$pcd %>% grep('S61 1LZ', x = .) #1981275
# pcd_df$oseast1m[1981275] #441515
# pcd_df$osnrth1m[1981275] #393038

#Make S61_1LZ a point
S61_1LZ <-
  st_point(
    c(441515, 393038)
  )

S61_1LZ <-
  S61_1LZ %>%
  st_sfc(
    crs = st_crs(ukgrid)
  )

# buffer point ------------------------------------------------------------


tmap_mode('view')

S61_1LZ <-
  S61_1LZ %>% 
  st_buffer(1500)



# subset and make quartiles -------------------------------------------------

rel_borders <-
  shef_borders %>%
  st_intersection(S61_1LZ)

#create relative rank just for Masborough area
rel_borders <-
  rel_borders %>%
  arrange(std_diff_phi) %>%
  mutate(
    order_rel = 1:nrow(rel_borders),
    rank_rel = order_rel / (nrow(rel_borders)) * 100,
    quartile_rel = ntile(-std_diff_phi, 3)
  )

rel_borders$length <-
  rel_borders %>% st_length()

##  Summaries; Q1 = highest percentile group
rel_borders %>% 
  group_by(quartile_rel) %>%
  select(std_diff_phi:length) %>%
  summarise_all( mean ) 

rel_borders %>% summary ## check for the stat vs the random map


# create maps  ------------------------------------------------------------


mapA <- #Qs 1
  rel_borders %>%
  filter(
    quartile_rel %in% c(1)
  ) 

mapB <- #Qs 2
  rel_borders %>%
  filter(
    quartile_rel %in% c(2)
  ) 

mapC <- #Qs 3
  rel_borders %>%
  filter(
    quartile_rel %in% c(3)
  ) 

# mapD <- #Qs 4
#   rel_borders %>%
#   filter(
#     quartile_rel %in% c(4)
#   ) 
# 
# mapE <- #Qs 1&3
#   rel_borders %>%
#   filter(
#     quartile_rel %in% c(1, 3)
#   ) 


# save maps ---------------------------------------------------------------
mapdataList <-
  list(
    a = mapA,
    b = mapB,
    c = mapC#,
#    d = mapD#,
#    e = mapE
  )


mapdataList %>% saveRDS('cleaned data/01 data for trial maps.rds')
