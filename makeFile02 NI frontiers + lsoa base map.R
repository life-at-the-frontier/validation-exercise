## makeFile borders and frontiers + lsoa base

##  This script takes the model object created in the nordF project and clean it
##  Source = measureFrontiers/ ni-03.R script 

# Input/output ------------------------------------------------------------


##  Raw files come from the UK frontiers estimation
##  model has the data; has ttwa data
## Drop the data here from the nordF project

sfModels_path <- 
  'temp data/ni-03 saved frontiers.rds'


## Output 
derryBase_Here <- 
  'cleaned data/makeFile02 derry ttwa lsoa.rds'

derryBorders_Here <-
  'cleaned data/makeFile02 derry borders+frontiers.rds'



## Additional library call from the socialFrontier package
library(socialFrontiers)

# 1. The areal data is in sfModels ----------------------------------------

##  Extract areal data from derryfield
sfModels <-
  sfModels_path %>% readRDS

names(sfModels)

derry_sf <-
  sfModels$cob_model$data


##  save this to cleaned data
derry_sf %>% saveRDS(
  derryBase_Here
)

# 2. Extract borders incld. frontiers -------------------------------------

## Check for fix using latest sf version 
frontier_as_sf

## checkout purr version
# require(devtools)
# install_github(
#   repo = 'https://github.com/MengLeZhang/socialFrontiers/tree/issue8-purrr+map2',
#                build_opts = c("--no-resave-data", "--no-manual"), build_vignettes = TRUE)



# [Issue] using purr branch it doesn't work -------------------------------
library(purrr)


## extracting all borders may take a while
sfBorders <-
  frontier_as_sf(
    sfModels$catholics_model,
    non_frontiers = T,
#    method = 'forLoop',
    silent = T
  )

## error message = 
# user  system elapsed 
# 3.63    0.05    3.68 
# Warning messages:
#   1: In st_collection_extract.sf(borders.sf, type = "LINE") :
#   x contains no geometries of specified type
# 2: In st_collection_extract.sf(borders.sf, type = "LINE") :
#   x contains no geometries of specified type

# end issue ---------------------------------------------------------------





## adhoc (can remove without effect); save LSOA11cd
sfBorders <-
  sfBorders %>%
  mutate(
    lsoacd_1 = shef_sf$lsoa11cd[id],
    lsoacd_2 = shef_sf$lsoa11cd[id.1],
    diff_phi = abs(phi - phi.1),
    std_diff_phi = diff_phi / sd( (phi - phi.1) )
  )



# 3. Save the data --------------------------------------------------------

sfBorders %>% saveRDS(
  shefBorders_Here
)
