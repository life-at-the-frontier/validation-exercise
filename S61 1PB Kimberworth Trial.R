###S61 1PB - Kimberworth Trial
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


###Centre of Kimberworth = S61 1PB

ukgrid = "+init=epsg:27700"

#Find coord for S61 1PB
pcd_df <- read.csv('temp data/NSPL_FEB_2020_UK/Data/NSPL_FEB_2020_UK.csv')
pcd_df %>% head
pcd_df$pcd %>% grep('S61 1PB', x = .) #1981289
pcd_df$oseast1m[1981289] #440243
pcd_df$osnrth1m[1981289] #393689

#Make S61_1PB a point
S61_1PB <-
  st_point(
    c(440243, 393689)
  )

S61_1PB <-
  S61_1PB %>%
  st_sfc(
    crs = st_crs(ukgrid)
  )

S61_1PB %>% qtm

S61_1PB <-
  S61_1PB %>% 
  st_buffer(2000)

S61_1PB %>% qtm

#S61_1PB %>% saveRDS('cleaned data/S61 1PB borders.rds')
## subset
these_borders <- 
  combined_maps[S61_1PB, ]

#S61_1PB_borders <-
# 'cleaned data/S61 1PB borders.rds' %>% readRDS



#facet maps
tmap_mode('view')

tm_shape(S61_1PB) + 
  tm_borders(alpha = 0.5) +
  tm_shape(
    these_borders %>% 
      filter(type %in% c('b', 'd'))
  ) +
  tm_lines(lwd = 3) +
  tm_facets('type', sync = T)


tm_shape(S61_1PB) + 
  tm_borders(alpha = 0.5) +
  tm_shape(
    these_borders %>% 
      filter(type %in% c('a', 'c'))
  ) +
  tm_lines(lwd = 3) +
  tm_facets('type', sync = T)

