##  option01: try OA borders based on example01


# input/ output -----------------------------------------------------------

## input
shefBase_Here <- 
  'cleaned data/makeFile02 sheffield ttwa oa.rds'

shefBorders_Here <-
  'cleaned data/makeFile02 sheffield borders+frontiers.rds'



# 1. read in the data -----------------------------------------------------

shef_sf <-
  shefBase_Here %>% readRDS

shef_borders <-
  shefBorders_Here %>% readRDS

# Example map -------------------------------------------------------------
shef_borders[1, ]

shef_borders$std_diff_phi %>% summary ## mean is quite high
shef_borders$std_diff_phi %>% quantile( c(0.75, 0.8, 0.85, 0.9))

##  Example maybe using 85% - 100% and 75% - 90% -- throws people off?
##  or 3 level add in 65% - 80%
##  We have 3 choices then so we sets of comparisons 3^1 choiceset


# Add percentile ranks ----------------------------------------------------


shef_borders <-
  shef_borders %>%
  arrange(std_diff_phi) %>%
  mutate(
    order = 1:nrow(shef_borders),
    rank = order / (nrow(shef_borders)) * 100
  )



# 2. Create central point to check around ---------------------------------

###Centre of Masborough, Henley and Ferham = S61 1LZ

ukgrid = "+init=epsg:27700"

#Find coord for S61 1LZ
# pcd_df <- read.csv('temp data/NSPL_FEB_2020_UK/Data/NSPL_FEB_2020_UK.csv')
# pcd_df %>% head
# pcd_df$pcd %>% grep('S61 1LZ', x = .) #1981275
# pcd_df$oseast1m[1981275] #441515
# pcd_df$osnrth1m[1981275] #393038

#Make S61_1LZ a point
centrePoint <-
  st_point(
    c(441515, 393038)
  )

centrePoint <-
  centrePoint %>%
  st_sfc(
    crs = st_crs(ukgrid)
  )

centrePoint <-
  centrePoint %>% 
  st_buffer(1.5e3)

centrePoint %>% qtm


# 2. Hotfix: restrict to masborough and create borders --------------------

## This is because actually extracting all the data in rotherham takes too long

## restrict to only oas intersecting the centrepoint 
these_zones <- 
  shef_sf[centrePoint, ]


shef_borders <-
  shef_borders %>%
  filter(
    (oacd_1 %in% these_zones$oa11cd) & (oacd_2 %in% these_zones$oa11cd)
  )
shef_sf %>% head


## Extract borders now!!!
## okay so only some borders now 
##  code from frontier_as_sf
x <- proc.time()
borders_list <- list(NULL)
for (i in 1:nrow(shef_borders)) {
  zone1 <- shef_borders$id[i]
  zone2 <- shef_borders$id.1[i]
  borders_list[[i]] <- shef_sf[zone1, ] %>% sf::st_intersection(shef_sf[zone2, ]) %>% sf::st_cast("MULTILINESTRING")
  if ((i%%10 == 0)) {
    print(i)
  }
}
print(proc.time() - x)
y <- proc.time()

## preallocate and combine
n <- length(borders_list)
borders_sf <- borders_list[[1]]
borders_sf[n, ] <- borders_list[[n]]
for (j in 1:n) {
  borders_sf[j, ] <- borders_list[[j]]
}

borders_sf ##final product
## end of loops

shef_borders %>% nrow
borders_sf %>% nrow

shef_borders %>% head
borders_sf %>% head

## now to append the geom file
shef_borders <- 
  shef_borders %>%
  mutate(
    geometry = borders_sf$geometry
  ) %>%
  st_as_sf(sf_column_name = 'geometry')


shef_borders
## restrict the edges to only those including these zones
  


# end hotfix --------------------------------------------------------------


# 3. Restrict around centre point and add relative_rank -------------------

these_borders <-
  shef_borders %>%
  st_intersection(
    centrePoint
  )

these_borders <-
  these_borders %>%
  arrange(std_diff_phi) %>%
  mutate(
    rel_order = 1:nrow(these_borders),
    rel_rank = rel_order / (nrow(these_borders)) * 100
  )

these_borders %>% summary
these_borders$std_diff_phi %>% quantile ## around 25% over 1.96



# 4. intersect and create map ---------------------------------------------


mapA <- 
  these_borders %>%
  filter(
    std_diff_phi > 1.96
  ) 

## mapA ~ 25%
## We can map B to have the 50% lowest of map A 
mapB <- 
  these_borders %>%
  filter(
    rel_rank %>% between(50, 75)
  )

# mapC <- 
#   these_borders %>%
#   filter(
#     rel_rank %>% between(65, 80)
#   ) 

## randomise
set.seed(123) # sets random number gen
rand.index <- 
  sample.int(nrow(these_borders), 
             (nrow(mapA)
              )
  )

rand.index

mapD <-
  these_borders[rand.index, ]

### Collate

set.seed(444)
order_id <- 
  1:4
#  sample.int(4, 4)

typeName <- 
  letters[order_id]


combined_maps <-
  bind_rows(
    mapA %>% mutate(type = typeName[1]),
    mapB %>% mutate(type = typeName[2]),
#    mapC %>% mutate(type = typeName[3]),
    mapD %>% mutate(type = typeName[4])
  )



##  Descriptives: -------------------

combined_maps$lengths <- st_length(combined_maps) %>% as.numeric

## sum of lengths 
combined_maps %>%
  group_by(type) %>%
  summarise(
    nborders = n(),
    sum_length = lengths %>% sum
  )



## mean of other vars
combined_maps %>%
  group_by(type) %>%
  summarise_if(
    is.numeric,
    mean
  )



## [Results] 
##  [Desc] Buffer changed to 1.5km.
##  Map A has over 1.96SD phi (approx 25%), B is between ranks 50 and 75 (no overlap with A)
##  D is random with same n borders A. C is omitted.
##  ---
##  Lengths are comparable between A and B but not C (due to randomisation)
##  mean std_diff_phi is actually lower for than 1.6 for B and C -- A>C>B
## cleaned up tiny borders <50m

# xx. Check the maps ------------------------------------------------------


tmap_mode('view')

tm_shape(centrePoint) + 
  tm_borders(
    lty = 'dotted',
    alpha = 0.5) +
  tm_shape(
    combined_maps %>% 
      filter(lengths > 50)
  ) +
  tm_lines(
    lwd = 3) +
  tm_facets('type', sync = T)

