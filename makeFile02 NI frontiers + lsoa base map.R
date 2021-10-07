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

##  Extract areal data from derry
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


# frontier_sf [hotfixes] --------------------------------------------------

# [Issue] In summary, NI polygons are a bit jank and there are improper intersections
##  fixed =
##  1. buffer the polygons
##  2. don't convert to lines in frontier_as_sf

## First use this version of frontier_as_sf
##  [frontier_as_sf version = issue8;purr hotfix]
# require(devtools)
# install_github(
#   "https://github.com/MengLeZhang/socialFrontiers/tree/issue8-purrr+map2",
#   build_opts = c("--no-resave-data", "--no-manual"),
#   build_vignettes = TRUE
# )



# [HOTFIX] buffer polygons to fix intersections
sfModels$cob_model$data <- 
  sfModels$cob_model$data %>% st_buffer(1)


## extracting all borders may take a while
sfBorders <-
  frontier_as_sf(
    sfModels$cob_model,
    non_frontiers = T,
    silent = T,
    convert2Line = F # [HOTFIX]
  )



# [Check] does every border get extracted ------------------

sfModels$cob_model %>% summary
sfBorders %>% nrow


## adhoc (can remove without effect); save area code

sfBorders <-
  sfBorders %>%
  mutate(
    zone_1 = derry_sf$sa_id[id],
    zone_2 = derry_sf$sa_id[id.1],
    diff_phi = abs(phi - phi.1),
    std_diff_phi = diff_phi / sd( (phi - phi.1) )
  )



# 3. Save the data --------------------------------------------------------

sfBorders %>% saveRDS(
  derryBorders_Here
)
