##  0x - visualisations maps 


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



# explore -----------------------------------------------------------------

shef_sf %>% head

shef_sf [1,] %>% qtm
shef_sf[1:10, ]

shef_sf <-
  shef_sf %>% 
  mutate(
    y = 1
  )

shef_borders %>% head
shef_borders[1, ] %>% qtm

# Example map -------------------------------------------------------------

tmap_mode('plot')

shef_borders %>%
  qtm

shef_borders %>% head

shef_borders %>%
  filter(
    std_diff_phi > 1.96
    ) %>% 
  qtm


# turn on interactive maps ------------------------------------------------
tmap_mode('view')

shef_borders %>%
  filter(
    std_diff_phi > 1.96) %>%
  filter(
    frontier == T
  ) %>%
  qtm


##  more lengthy version
# tm_shape(thisGISobj) +
#   tm_lines() +
#   tm_dots


tm_shape(
  shef_borders %>%
    filter(
      std_diff_phi > 1.96) %>%
    filter(
      frontier == T
    ) 
  ) +
  tm_lines( lwd = 4)



# adding on more details --------------------------------------------------
shef_sf <-
  shef_sf %>%
  mutate(
    propForeign = nonUKBorn/ allResidents
  )

shef_sf %>% head

propMap <- 
  tm_shape(shef_sf) +
  tm_fill(
    'propForeign',
    alpha = 0.2
  )
  
propMap 

frontiersMap <-
  tm_shape(
    shef_borders %>%
      filter(
        std_diff_phi > 1.96) %>%
      filter(
        frontier == T
      ) 
  ) +
  tm_lines( lwd = 4)

## put both maps together
propMap + frontiersMap


# add in geodata ----------------------------------------------------------

# https://www.maths.lancs.ac.uk/~rowlings/Teaching/UseR2012/cheatsheet.html

ukgrid = "+init=epsg:27700"

## check SF guide book to add in a sheffield uni's postcode as an point object
this_Point <-
  st_point(
    c(5e5, 5e5)
  )


this_Point %>% st_sfc %>% qtm

this_Point <-
  this_Point %>%
  st_sfc(
    crs = st_crs(ukgrid)
    )

this_Point  %>% qtm

this_Point_plus1k <-
  this_Point %>% st_buffer(1000)

this_Point_plus1k %>% qtm

tm_shape(this_Point_plus1k) +
  tm_borders()

## Alternative get the centroid of an existing area in sheffiled

shef_sf[1,] %>% qtm

this_Place <- 
  shef_sf[1, ] %>%
  st_centroid()

this_Place %>% qtm

# Task: Read in the postcode file and find sheffield unis coord -----------
##  1. find coord
##  2. turn it into a gis object
##  3. map it onto the map of sheffield and frontiers

# Task: Read in the postcode file and find sheffield unis coord -----------
##  1. find coord
pcd_df <- read.csv('temp data/NSPL_FEB_2020_UK/Data/NSPL_FEB_2020_UK.csv')
pcd_df %>% head
pcd_df$pcd %>% grep('S10 2TN', x = .)
pcd_df$oseast1m[1953603] #434120
pcd_df$osnrth1m[1953603] #387290

##  2. turn it into a gis object
shef_uni <-
  st_point(
    c(434120, 387290)
  )

shef_uni <-
  shef_uni %>%
  st_sfc(
    crs = st_crs(ukgrid)
  )

shef_uni %>% qtm

shef_uni_1k <-
  shef_uni %>% st_buffer(1000)

shef_uni_2k <-
  shef_uni %>% st_buffer(2000)

shef_uni_1k %>% qtm

shef_radius_map <- tm_shape(shef_uni_1k) +
  tm_borders()

shef_radius2k <- tm_shape(shef_uni_2k) + tm_borders()

shef_radius_map + frontiersMap
shef_radius_map + propMap

shef_radius2k + frontiersMap


tmap_options

##  3. map it onto the map of sheffield and frontiers
