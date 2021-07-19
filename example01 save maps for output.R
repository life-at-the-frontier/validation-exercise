##  0y try randomisation for maps


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


# Example map -------------------------------------------------------------
shef_borders[1, ]

shef_borders$std_diff_phi %>% summary ## mean is quite high
shef_borders$std_diff_phi %>% quantile( c(0.75, 0.8, 0.85, 0.9))

## definitely not actually normall distributed -- roughly top 85% is over 1.8%


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


###
mapA <- 
  shef_borders %>%
  filter(
    rank > 85
  ) 

mapB <- 
  shef_borders %>%
  filter(
    rank %>% between(75, 90)
  )

mapC <- 
  shef_borders %>%
  filter(
    rank %>% between(65, 80)
  ) 

## randomise
set.seed(123) # sets random number gen
rand.index <- 
  sample.int(nrow(shef_borders), 242)

rand.index

mapD <-
  shef_borders[rand.index, ]
mapD

mapD$rank %>% summary


### Collate

set.seed(444)
order_id <- sample.int(4, 4)

typeName <- 
  letters[order_id]


combined_maps <-
  bind_rows(
  mapA %>% mutate(type = typeName[1]),
  mapB %>% mutate(type = typeName[2]),
  mapC %>% mutate(type = typeName[3]),
  mapD %>% mutate(type = typeName[4])
)


# xx. Save the example maps for output ------------------------------------


###Rotherham United Community Sports Trust (RUCST) are based in S60 1AH

ukgrid = "+init=epsg:27700"

#Coord for S60 1AH
#Make RUCST a point
RUCST <-
  st_point(
    c(442732, 392677)
  )

RUCST <-
  RUCST %>%
  st_sfc(
    crs = st_crs(ukgrid)
  )

RUCST %>% qtm

RUCST <-
  RUCST %>% 
  st_buffer(2000)

## subset

## st_intersection(), get only the features of gis obj A that are contained within 
##  gis object B

RUCST_borders <- 
  combined_maps %>% 
  st_intersection(RUCST)




# xx. Check the maps ------------------------------------------------------


tmap_mode('view')

tm_shape(RUCST) + 
  tm_borders(
    lty = 'dotted',
    alpha = 0.5) +
  tm_shape(
    RUCST_borders %>% 
      filter(type %in% c('b', 'd'))
  ) +
  tm_lines(
    lwd = 3) +
  tm_facets('type', sync = T)
# 
# tm_shape(RUCST) + 
#   tm_borders(
#     lty = 'dotted',
#     alpha = 0.5) +
#   tm_shape(
#     RUCST_borders %>% 
#       filter(type %in% c('a', 'c'))
#   ) +
#   tm_lines(
#     lwd = 3) +
#   tm_facets('type', sync = T)
# 
# 
# tm_shape(RUCST) + 
#   tm_borders(
#     lty = 'dotted',
#     alpha = 0.5) +
#   tm_shape(
#     RUCST_borders %>% 
#       filter(type %in% c('c', 'b'))
#   ) +
#   tm_lines(
#     lwd = 3) +
#   tm_facets('type', sync = T)
# 

# Save the rotherham maps for example -------------------------------------
RUCST_borders %>% saveRDS('cleaned data/rotherham borders example.rds')

