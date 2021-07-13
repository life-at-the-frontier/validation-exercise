##  0x - visualisations maps 


# input/ output -----------------------------------------------------------

## input
shefBase_Here <- 
  'temp data/makeFile01 sheffield ttwa lsoa.rds'

shefBorders_Here <-
  'temp data/makeFile01 sheffield borders+frontiers.rds'



# 1. read in the data -----------------------------------------------------

shef_sf <-
  shefBase_Here %>% readRDS

shef_borders <-
  shefBorders_Here %>% readRDS


# Example map -------------------------------------------------------------


shef_borders %>%
  qtm

shef_borders %>% head

shef_borders %>%
  filter(
    std_diff_phi > 1.96) %>% 
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

propMap <- 
  tm_shape(shef_sf) +
  tm_fill(
    'propForeign'
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
  st_sfc(crs = st_crs(ukgrid))

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
