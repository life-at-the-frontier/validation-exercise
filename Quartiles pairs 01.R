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

tmap_mode('view')

S61_1LZ %>% qtm

S61_1LZ <-
  S61_1LZ %>% 
  st_buffer(1500)

S61_1LZ %>% qtm

#S61_1LZ %>% saveRDS('cleaned data/S61 1LZ borders.rds')


# subset ------------------------------------------------------------------

shef_borders <-
  shef_borders[S61_1LZ, ]

shef_borders %>% qtm

#create relative rank just for Masborough area
rel_borders <-
  shef_borders %>%
  arrange(std_diff_phi) %>%
  mutate(
    order = 1:nrow(shef_borders),
    rank = order / (nrow(shef_borders)) * 100
  )


rel_borders <-
  rel_borders %>%
  st_intersection(S61_1LZ)


mapA <- #Qs 1&2
  rel_borders %>%
  filter(
    rank %>% between(75, 100) | rank %>% between(50, 75)
  ) 

mapB <- #Qs 3&4
  rel_borders %>%
  filter(
    rank %>% between(25, 50) | rank %>% between(0 , 25)
  ) 

mapC <- #Qs 2&3
  rel_borders %>%
  filter(
    rank %>% between(50, 75) | rank %>% between(25, 50)
  ) 

mapD <- #Qs 2&4
  rel_borders %>%
  filter(
    rank %>% between(50, 75) | rank %>% between(0, 25)
  ) 

mapE <- #Qs 1&3
  rel_borders %>%
  filter(
    rank %>% between(75, 100) | rank %>% between(25, 50)
  ) 



#Collate in pairs
set.seed(123)
rep <- replicate(4, sample.int(2, 2)
          )
?replicate
rep[,4][2]

#set.seed(444)
order_id <- 
  #  sample.int(4, 4)
 1:2
typeName <- 
  letters[order_id]


pair_1 <-
  bind_rows(
    mapA %>% mutate(type = typeName[1], pair = 1),
    mapB %>% mutate(type = typeName[2], pair = 1),
  )

pair_2 <-
  bind_rows(
    mapA %>% mutate(type = typeName[1], pair = 2),
    mapC %>% mutate(type = typeName[2], pair = 2),
  )

pair_3 <-
  bind_rows(
    mapD %>% mutate(type = typeName[1], pair = 3),
    mapC %>% mutate(type = typeName[2], pair = 3),
  )

pair_4 <-
  bind_rows(
    mapE %>% mutate(type = typeName[1], pair = 4),
    mapC %>% mutate(type = typeName[2], pair = 4),
  )


#Randomise order
set.seed(321)
rep2 <- replicate(1, sample.int(4, 4)
)
rep2
rep[,4][2]

order_id2 <- 
  1:4
typeName2 <- 
  letters[order_id2]

pair_1 %>% mutate(pair_order = typeName2[2])
pair_2 %>% mutate(pair_order = typeName2[1])
pair_3 %>% mutate(pair_order = typeName2[4])
pair_4 %>% mutate(pair_order = typeName2[3])

tmap_mode('view')


pairMap1 <- 
tm_shape(S61_1LZ) + 
  tm_borders(alpha = 0.5) +
# tm_shape(base_layer) +
# tm_fill('propFor', alpha = 0.2) +
  tm_shape(
    pair_1
  ) +
  tm_lines(lwd = 3) +
  tm_facets('type', sync = T)

pairMap2 <- 
tm_shape(S61_1LZ) + 
  tm_borders(alpha = 0.5) +
  # tm_shape(base_layer) +
  # tm_fill('propFor', alpha = 0.2) +
  tm_shape(
    pair_2
  ) +
  tm_lines(lwd = 3) +
  tm_facets('type', sync = T)

pairMap3 <- 
tm_shape(S61_1LZ) + 
  tm_borders(alpha = 0.5) +
  # tm_shape(base_layer) +
  # tm_fill('propFor', alpha = 0.2) +
  tm_shape(
    pair_3
  ) +
  tm_lines(lwd = 3) +
  tm_facets('type', sync = T)

pairMap4 <- 
tm_shape(S61_1LZ) + 
  tm_borders(alpha = 0.5) +
  # tm_shape(base_layer) +
  # tm_fill('propFor', alpha = 0.2) +
  tm_shape(
    pair_4
  ) +
  tm_lines(lwd = 3) +
  tm_facets('type', sync = T)


pairMapList <-
  list(
    pairMap1,
    pairMap2,
    pairMap3,
    pairMap4
  )

pairMapList %>% saveRDS('cleaned data/Quartile maps saved.rds')

pairMapList[[1]]

pairMapList[[2]]

pairMapList[[3]]

pairMapList[[4]]
