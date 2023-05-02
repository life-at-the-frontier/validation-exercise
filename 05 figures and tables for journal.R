## images for PLOSone 

# inputs ------------------------------------------------------------------

mapdataList <- readRDS('cleaned data/01 data for trial maps.rds')
centrePoint <- mapdataList$centrePoint


## Put everything in one map

pair_all <-
  bind_rows(
    mapdataList$a %>% mutate(type = 'A'),
    mapdataList$b %>% mutate(type = 'B'),
    mapdataList$c %>% mutate(type = 'C')
  )



# 1.1 Add bound box -------------------------------------------------------

mapBB <- tmaptools::bb(centrePoint)


# 2. create the tmap objs  ---------------------------------------------------
## remember to save manually
tmap_mode('view')



# 2.1. Create centre point layer ------------------------------------------

firstLayer <-
  tm_shape(centrePoint,     
           bbox = mapBB) +
  tm_borders(alpha = 0.5) 


firstLayer +  
  tm_shape(
    pair_all %>% select(type),
    name = 'borders'
  ) +
  tm_lines(lwd = 5) +
  tm_facets('type', sync = T)


## Colour coded big map


# Map over underlying data ------------------------------------------------

## Get LSOA data from somewhere else in the LATF 

lsoa <- 
  readRDS(url('https://github.com/life-at-the-frontier/detect-uk-frontiers/raw/main/output/sheffield%20lsoa%20layer.rds'))

lsoa <-
  lsoa %>%
  mutate(
    `Prop. Foreign born` = (nonUKBorn / allResidents) * 100
  )

lsoa %>% summary

tmap_mode('plot')

firstLayer +  
  tm_shape(
    lsoa
  ) +
  tm_fill(col = 'Prop. Foreign born', style = 'cont',
          alpha = 0.8,
           legend.is.portrait = T) +
  # tm_layout(legend.outside.position = "bottom",
  #           legend.outside.size = 0.35,
  #           legend.outside = TRUE) +
  firstLayer +  
  tm_shape(
    pair_all %>% select(type),
    name = 'borders'
  ) +
  tm_lines(lwd = 5) +
  tm_facets('type', sync = T) 
