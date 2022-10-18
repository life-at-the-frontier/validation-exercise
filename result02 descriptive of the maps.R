# result02 describing the map set


# input -------------------------------------------------------------------

mapdataList <- readRDS('cleaned data/01 data for trial maps.rds')

# data wrangling ----------------------------------------------------------

mapdata <- bind_rows(
  a = mapdataList$a,
  b = mapdataList$b,
  c = mapdataList$c,
  .id = 'map'
)

# summaries ---------------------------------------------------------------

mapdata %>% 
  as.data.frame() %>%
  group_by(map) %>%
  select(std_diff_phi:length, - geometry) %>%
  summarise_all( mean ) 

# other stats
mapdata %>% 
  as.data.frame() %>%
  group_by(map) %>%
  select(std_diff_phi:length) %>%
  summarise_if( 
    is.numeric, 
    list(min = min, max = max)
  )

## Rank is their rank in the entire Sheffield and Rotherham area

## Graphs
## note: densities for rank and std_phi shouldn't overlap in reality 
mapdata %>% 
  as.data.frame() %>%
  ggplot(aes(x = rank)) +
  geom_density(
    aes(group = map, fill = map),
    alpha = 0.2
    )
  
mapdata %>% 
  as.data.frame() %>%
  ggplot(aes(x = std_diff_phi)) +
  geom_density(
    aes(group = map, fill = map),
    alpha = 0.2
  )

mapdata %>% 
  as.data.frame() %>%
  ggplot(aes(x = length)) +
  geom_density(
    aes(group = map, fill = map),
    alpha = 0.2
  )


# figure of map ---------------------------------------------------------
## Note: R 4.0.0 break rjava -- I know this part works under R 4.2.1
library(leaflet)
library(tmaptools)
library(OpenStreetMap)

centrePoint <- mapdataList$centrePoint
mapBB <- tmaptools::bb(centrePoint)

osm_NLD <- read_osm(centrePoint, ext=1.1)
tm_shape(osm_NLD) + tm_rgb(alpha = 0.3)

firstLayer <-
  tm_shape(osm_NLD) + tm_rgb(alpha = 0.3) +
    tm_shape(centrePoint,     
             bbox = mapBB) +
    tm_borders(alpha = 0.5) 
  

# pair1_1
firstLayer +  
  tm_shape(
    mapdata %>% select(map),
    name = 'borders'
  ) +
  tm_lines(lwd = 5) +
  tm_facets('map', free.coord = F) 

?tm_facets
