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
