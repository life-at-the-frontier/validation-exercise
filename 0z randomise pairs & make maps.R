
# Randomise pairs and save maps -------------------------------------------


# inputs ------------------------------------------------------------------

mapdataList <- readRDS('cleaned data/01 data for trial maps.rds')



# 1. Create map pairs and randomise which map is on lhs ----------------------

# refresher on map order
# mapA <- #Qs 1&2
# mapB <- #Qs 3&4
# mapC <- #Qs 2&3
# mapD <- #Qs 2&4
# mapE <- #Qs 1&3



#Collate in pairs
#set.seed(123)
map_a_position <-
  sample.int(2, 4, replace = T)

map_b_position <-
  ifelse(map_a_position == 2, 1, 2)


pair_1 <-
  bind_rows(
    mapA %>% mutate(type = map_a_position[1], pair = 1),
    mapB %>% mutate(type = map_b_position[1], pair = 1),
  )

pair_2 <-
  bind_rows(
    mapA %>% mutate(type = map_a_position[2], pair = 2),
    mapC %>% mutate(type = map_b_position[2], pair = 2),
  )

pair_3 <-
  bind_rows(
    mapD %>% mutate(type = map_a_position[3], pair = 3),
    mapC %>% mutate(type = map_b_position[3], pair = 3),
  )

pair_4 <-
  bind_rows(
    mapE %>% mutate(type = map_a_position[4], pair = 4),
    mapC %>% mutate(type = map_b_position[4], pair = 4),
  )

all_pairs <- list(pair_1, pair_2, pair_3, pair_4)


# create the tmap objs  ---------------------------------------------------

#tmap_mode('view')


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


# Randomise map pairs and save the order ----------------------------------

## Create directory
map.dir <- 
  'output maps'

dir.create(
  map.dir
)

##  Then randomise pairs

pairOrder <- 
  sample.int(4, 4)

randPairs <- pairMapList[pairOrder]

## save the randomised order
randPairs %>% 
  saveRDS(
    map.dir 
    %>% file.path('random map pairs.rds')
  )


##  Save order 

orderFile <-
  data.frame(
    shownOrder = 1:4,
    pairID = pairOrder,
    map_a_position = map_a_position[pairOrder]
  )

orderFile %>% 
  write.csv(
    map.dir %>% file.path('map order.csv'),
    row.names = F
  )



# final step render markdown ----------------------------------------------

rmarkdown::render(
  map.dir %>% file.path("renderPair1.Rmd"), 
  params = list())

rmarkdown::render(
  map.dir %>% file.path("renderPair2.Rmd"), 
  params = list())

rmarkdown::render(
  map.dir %>% file.path("renderPair3.Rmd"), 
  params = list())

rmarkdown::render(
  map.dir %>% file.path("renderPair4.Rmd"), 
  params = list())


#
