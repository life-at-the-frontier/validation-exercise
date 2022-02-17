# makeFile03 malmo --------------------------------------------------------


# Input/output ------------------------------------------------------------


##  Raw files come from the UK frontiers estimation
##  model has the data; has ttwa data
## Drop the data here from the nordF project

sfModels_path <- 
  'temp data/malmo model for VE.rds'


## Output 
malmoBase_Here <- 
  'cleaned data/makeFile03 malmo deso.rds'

malmoBorders_Here <-
  'cleaned data/makeFile03 malmo borders+frontiers.rds'



## Additional library call from the socialFrontier package
library(socialFrontiers)

# 1. The areal data is in sfModels ----------------------------------------

##  Extract areal data from malmo
sfModels <-
  sfModels_path %>% readRDS

names(sfModels)

malmo_sf <-
  sfModels$data

malmo_sf %>% qtm

##  save this to cleaned data
malmo_sf %>% saveRDS(
  malmoBase_Here
)

# 2. Extract borders incld. frontiers -------------------------------------

## extracting all borders may take a while
sfBorders <-
  frontier_as_sf(
    sfModels,
    non_frontiers = T,
    silent = T,
#    convert2Line = F # [HOTFIX]
  )



# [Check] does every border get extracted ------------------

sfModels %>% summary
sfBorders %>% nrow


## adhoc (can remove without effect); save area code
## check names
malmo_sf %>% head

sfBorders <-
  sfBorders %>%
  mutate(
    zone_1 = malmo_sf$Deso[id],
    zone_2 = malmo_sf$Deso[id.1],
    diff_phi = abs(phi - phi.1),
    std_diff_phi = diff_phi / sd( (phi - phi.1) )
  )



# 3. Save the data --------------------------------------------------------

sfBorders %>% saveRDS(
  malmoBorders_Here
)

