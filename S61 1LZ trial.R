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

S61_1LZ %>% qtm

S61_1LZ <-
  S61_1LZ %>% 
  st_buffer(2000)

S61_1LZ %>% qtm

#S61_1LZ %>% saveRDS('cleaned data/S61 1LZ borders.rds')


# subset ------------------------------------------------------------------

shef_borders <-
  shef_borders[S61_1LZ, ]

shef_borders %>% qtm

## 1. Randomise based on this area
##  2. alternative based on frontierness in this area 
##  3. get stats on alternatives in terms of n. borders, total border length., diff_phi etc

shef_borders %>% st_length()
shef_borders %>% nrow
# -------------------------------------------------------------------------



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


mapD <-
  shef_borders[rand.index, ]

mapE <- 
  shef_borders  ##all borders 


### Collate

set.seed(444)
order_id <- 
#  sample.int(4, 4)
  1:5
typeName <- 
  letters[order_id]


combined_maps <-
  bind_rows(
    mapA %>% mutate(type = typeName[1]),
    mapB %>% mutate(type = typeName[2]),
    mapC %>% mutate(type = typeName[3]),
    mapD %>% mutate(type = typeName[4]),
    mapE %>% mutate(type = typeName[5])
  )


## subset
these_borders <- 
   combined_maps[S61_1LZ, ]

#S61_1LZ_borders <-
 # 'cleaned data/S61 1LZ borders.rds' %>% readRDS



#facet maps
tmap_mode('view')

tm_shape(S61_1LZ) + 
  tm_borders(alpha = 0.5) +
  tm_shape(
    these_borders %>% 
      filter(type %in% 
               c('a', 'b', 'c', 'd', 'e')
             )
  ) +
  tm_lines(lwd = 3) +
  tm_facets('type', sync = T)


