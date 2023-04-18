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

