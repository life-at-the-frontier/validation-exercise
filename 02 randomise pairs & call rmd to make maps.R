
# 02: Randomise pairs and save maps -------------------------------------------


# inputs ------------------------------------------------------------------

mapdataList <- readRDS('cleaned data/01 data for trial maps.rds')
centrePoint <- mapdataList$centrePoint


# 1. Create map pairs and randomise which map is on lhs ----------------------

## Current version = thirds 
# refresher on map order
# mapA <- #Qs 1
# mapB <- #Qs 2
# mapC <- #Qs 3
# mapD <- #NA


nPairs <- 3 # number of pairs

#Collate in pairs
#set.seed(123)
map_a_position <-
  sample.int(2, nPairs, replace = T)

#map_a_position

map_b_position <-
  ifelse(map_a_position == 2, 1, 2)


pair_1 <-
  bind_rows(
    mapdataList$a %>% mutate(type = map_a_position[1]),
    mapdataList$b %>% mutate(type = map_b_position[1]),
  )

pair_2 <-
  bind_rows(
    mapdataList$a %>% mutate(type = map_a_position[2]),
    mapdataList$c %>% mutate(type = map_b_position[2]),
  )

pair_3 <-
  bind_rows(
    mapdataList$b %>% mutate(type = map_a_position[3]),
    mapdataList$c %>% mutate(type = map_b_position[3]),
  )


all_pairs <- 
  list(pair_1, pair_2, pair_3#, 
       #pair_4
       )


# 2. create the tmap objs  ---------------------------------------------------

tmap_mode('view')


pairMap1 <-
  tm_shape(centrePoint) +
  tm_borders(alpha = 0.5) +
  tm_shape(
    pair_1
  ) +
  tm_lines(lwd = 3) +
  tm_facets('type', sync = T)

pairMap2 <- 
  tm_shape(centrePoint) + 
  tm_borders(alpha = 0.5) +
  tm_shape(
    pair_2
  ) +
  tm_lines(lwd = 3) +
  tm_facets('type', sync = T)

pairMap3 <- 
  tm_shape(centrePoint) + 
  tm_borders(alpha = 0.5) +
  tm_shape(
    pair_3
  ) +
  tm_lines(lwd = 3) +
  tm_facets('type', sync = T)


pairMapList <-
  list(
    pairMap1,
    pairMap2,
    pairMap3,
    pairMap4 =NA
  )
