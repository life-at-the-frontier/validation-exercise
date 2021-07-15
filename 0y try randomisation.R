##  0y try randomisation for maps


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


# Example map -------------------------------------------------------------

shef_borders$std_diff_phi %>% summary ## mean is quite high
shef_borders$std_diff_phi %>% quantile( c(0.75, 0.8, 0.85, 0.9))

## definitely not actually normall distributed -- roughly top 85% is over 1.8%


##  Example maybe using 85% - 100% and 75% - 90% -- throws people off?
##  or 3 level add in 65% - 80%
##  We have 3 choices then so we sets of comparisons 3^1 choiceset

## Add percentile ranks

shef_borders <-
  shef_borders %>%
  arrange(std_diff_phi) %>%
  mutate(
    rank = (1:nrow(shef_borders)) / (nrow(shef_borders)) * 100
  )

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


set.seed(123)
mapD <-
  shef_borders[sample.int(nrow(shef_borders), 242), ]


mapD$rank %>% summary




### Collate

set.seed(444)
order_id <- sample.int(4, 4)
typeName <- letters[1:4][order_id]

combined_maps <-
  bind_rows(
  mapA %>% mutate(type = typeName[1]),
  mapB %>% mutate(type = typeName[2]),
  mapC %>% mutate(type = typeName[3]),
  mapD %>% mutate(type = typeName[4])
)


### facet maps ---- 

tmap_mode('view')
tmap_options(check.and.fix = F)

combined_maps <-
  combined_maps %>% st_make_valid()
combined_maps[1, ]# %>% qtm


tm_shape(
  combined_maps %>% 
    filter(type %in% c('b', 'd'))
  ) +
  tm_lines(lwd = 3) +
  tm_facets('type', sync = T)

## all are frontiers basically 
