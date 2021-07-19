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


##  Example code
##  Pin pointing a location 
# shef_sf[1, ] %>% qtm
# 
# this_point <-
#   shef_sf[1, ] %>% st_centroid()
# 
# this_point <-
#   this_point %>% 
#   st_buffer(2000)
# 
# this_point %>% qtm
# 
# ## subset
# combined_maps[1:10, ]
# 
# these_borders <- 
#   combined_maps[this_point, ]
# 
# 
# ### facet maps ---- 
# 
# tmap_mode('view')
# 
# tm_shape(this_point) + 
#   tm_borders(alpha = 0.5) +
#   tm_shape(
#   these_borders %>% 
#     filter(type %in% c('b', 'd'))
#   ) +
#   tm_lines(lwd = 3) +
#   tm_facets('type', sync = T)
# 
# tm_shape(this_point) + 
#   tm_borders(alpha = 0.5) +
#   tm_shape(
#     these_borders %>% 
#       filter(type %in% c('a', 'c'))
#   ) +
#   tm_lines(lwd = 3) +
#   tm_facets('type', sync = T)
# 
## all are frontiers basically 

###Rotherham United Community Sports Trust (RUCST) are based in S60 1AH

ukgrid = "+init=epsg:27700"

#Find coord for S60 1AH
pcd_df <- read.csv('temp data/NSPL_FEB_2020_UK/Data/NSPL_FEB_2020_UK.csv')
pcd_df %>% head
pcd_df$pcd %>% grep('S60 1AH', x = .) #1979604
pcd_df$oseast1m[1979604] #442732
pcd_df$osnrth1m[1979604] #392677

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

RUCST %>% qtm

## subset

## st_intersection(), get only the features of gis obj A that are contained within 
##  gis object B

RUCST_borders <- 
  combined_maps %>% 
  st_intersection(RUCST)




RUCST_borders %>% saveRDS('cleaned data/rotherham borders example.rds')

#facet maps
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

tm_shape(RUCST) + 
  tm_borders(
    lty = 'dotted',
    alpha = 0.5) +
  tm_shape(
    RUCST_borders %>% 
      filter(type %in% c('a', 'c'))
  ) +
  tm_lines(
    lwd = 3) +
  tm_facets('type', sync = T)


tm_shape(RUCST) + 
  tm_borders(
    lty = 'dotted',
    alpha = 0.5) +
  tm_shape(
    RUCST_borders %>% 
      filter(type %in% c('c', 'b'))
  ) +
  tm_lines(
    lwd = 3) +
  tm_facets('type', sync = T)


# Save the rotherham maps for example -------------------------------------
RUCST_borders %>% saveRDS('cleaned data/rotherham borders example.rds')




###Holiday Camps are based in S65 1LN

ukgrid = "+init=epsg:27700"

#Find coord for S65 1LN
pcd_df <- read.csv('temp data/NSPL_FEB_2020_UK/Data/NSPL_FEB_2020_UK.csv')
pcd_df %>% head
pcd_df$pcd %>% grep('S65 1LN', x = .) #1985205
pcd_df$oseast1m[1985205] #443940
pcd_df$osnrth1m[1985205] #393560

#Make hol_camp a point
hol_camp <-
  st_point(
    c(443940, 393560)
  )

hol_camp <-
  hol_camp %>%
  st_sfc(
    crs = st_crs(ukgrid)
  )

hol_camp %>% qtm

hol_camp <-
  hol_camp %>% 
  st_buffer(1000)

hol_camp %>% qtm

## subset
hol_borders <- 
  combined_maps[hol_camp, ]

hol_borders %>% saveRDS('cleaned data/holiday camp borders.rds')

#facet maps
tmap_mode('view')

tm_shape(hol_camp) + 
  tm_borders(alpha = 0.5) +
  tm_shape(
    these_borders %>% 
      filter(type %in% c('b', 'd'))
  ) +
  tm_lines(lwd = 3) +
  tm_facets('type', sync = T)

tm_shape(hol_camp) + 
  tm_borders(alpha = 0.5) +
  tm_shape(
    these_borders %>% 
      filter(type %in% c('a', 'c'))
  ) +
  tm_lines(lwd = 3) +
  tm_facets('type', sync = T)


###Future Stars is based in S62 6FH

ukgrid = "+init=epsg:27700"

#Find coord for S62 6FH
pcd_df <- read.csv('temp data/NSPL_FEB_2020_UK/Data/NSPL_FEB_2020_UK.csv')
pcd_df %>% head
pcd_df$pcd %>% grep('S62 6FH', x = .) #1982494
pcd_df$oseast1m[1982494] #443479
pcd_df$osnrth1m[1982494] #395237

#Make future_stars a point
future_stars <-
  st_point(
    c(443479, 395237)
  )

future_stars <-
  future_stars %>%
  st_sfc(
    crs = st_crs(ukgrid)
  )

future_stars %>% qtm

future_stars <-
  future_stars %>% 
  st_buffer(3000)

future_stars %>% qtm

## subset
fs_borders <- 
  combined_maps[future_stars, ]

#facet maps
tmap_mode('view')

tm_shape(future_stars) + 
  tm_borders(alpha = 0.5) +
  tm_shape(
    these_borders %>% 
      filter(type %in% c('b', 'd'))
  ) +
  tm_lines(lwd = 3) +
  tm_facets('type', sync = T)

tm_shape(future_stars) + 
  tm_borders(alpha = 0.5) +
  tm_shape(
    these_borders %>% 
      filter(type %in% c('a', 'c'))
  ) +
  tm_lines(lwd = 3) +
  tm_facets('type', sync = T)
