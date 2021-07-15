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



##  Pin pointing a location 
shef_sf[1, ] %>% qtm

this_point <-
  shef_sf[1, ] %>% st_centroid()

this_point <-
  this_point %>% 
  st_buffer(2000)

this_point %>% qtm

## subset
combined_maps[1:10, ]

these_borders <- 
  combined_maps[this_point, ]


### facet maps ---- 

tmap_mode('view')

tm_shape(this_point) + 
  tm_borders(alpha = 0.5) +
  tm_shape(
  these_borders %>% 
    filter(type %in% c('b', 'd'))
  ) +
  tm_lines(lwd = 3) +
  tm_facets('type', sync = T)

## all are frontiers basically 
