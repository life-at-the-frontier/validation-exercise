
# 02: Randomise pairs and save maps -------------------------------------------


# inputs ------------------------------------------------------------------

mapdataList <- readRDS('cleaned data/01 data for trial maps.rds')
centrePoint <- mapdataList$centrePoint


# 1. Create map pairs and randomise which map is on lhs ----------------------

## Current version = thirds 


## permutation of pair 1
pair1_1 <-
  bind_rows(
    mapdataList$a %>% mutate(type = 1),
    mapdataList$b %>% mutate(type = 2),
  )

pair1_2 <-
  bind_rows(
    mapdataList$a %>% mutate(type = 2),
    mapdataList$b %>% mutate(type = 1),
  )

## permutations of pair 2
pair2_1 <-
  bind_rows(
    mapdataList$a %>% mutate(type = 1),
    mapdataList$c %>% mutate(type = 2),
  )

pair2_2 <-
  bind_rows(
    mapdataList$a %>% mutate(type = 2),
    mapdataList$c %>% mutate(type = 1),
  )


##  permutations of pair 3
pair3_1 <-
  bind_rows(
    mapdataList$b %>% mutate(type = 1),
    mapdataList$c %>% mutate(type = 2),
  )

pair3_2 <-
  bind_rows(
    mapdataList$b %>% mutate(type = 2),
    mapdataList$c %>% mutate(type = 1),
  )


# 2. create the tmap objs  ---------------------------------------------------
## remember to save manually
tmap_mode('view')

# pair1_1
  tm_shape(centrePoint) +
  tm_borders(alpha = 0.5) +
  tm_shape(
    pair1_1
  ) +
  tm_lines(lwd = 3) +
  tm_facets('type', sync = T)

## pair1_2  
  tm_shape(centrePoint) +
    tm_borders(alpha = 0.5) +
    tm_shape(
      pair1_2
    ) +
    tm_lines(lwd = 3) +
    tm_facets('type', sync = T)
  
# pair2_1
  tm_shape(centrePoint) +
    tm_borders(alpha = 0.5) +
    tm_shape(
      pair2_1
    ) +
    tm_lines(lwd = 3) +
    tm_facets('type', sync = T)
  
  ## pair2_2  
  tm_shape(centrePoint) +
    tm_borders(alpha = 0.5) +
    tm_shape(
      pair2_2
    ) +
    tm_lines(lwd = 3) +
    tm_facets('type', sync = T)
  

# pair3_1
  
  tm_shape(centrePoint) +
    tm_borders(alpha = 0.5) +
    tm_shape(
      pair3_1
    ) +
    tm_lines(lwd = 3) +
    tm_facets('type', sync = T)
  
  ## pair3_2  
  tm_shape(centrePoint) +
    tm_borders(alpha = 0.5) +
    tm_shape(
      pair3_2
    ) +
    tm_lines(lwd = 3) +
    tm_facets('type', sync = T)
  
# Instruction: Export the maps by hand into /output pairs alternat --------


