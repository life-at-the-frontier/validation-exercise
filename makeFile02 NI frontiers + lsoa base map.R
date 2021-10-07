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

## [Debug script] issue found when converting lines due to bad geoms?
##  using code from issue8: purr+map2 function


frontier_model = sfModels$cob_model
non_frontiers = T
silent = F


data.class <- class(frontier_model)
if (!("frontier_model" %in% data.class)) 
  stop("Not a frontier_model object; please run frontier_detect()")
egdelist_frontier <- which(frontier_model$W.frontiers == 
                             0, arr.ind = T) %>% data.frame(frontier = T)
egdelist_nonfrontier <- which(frontier_model$W.frontiers == 
                                1, arr.ind = T) %>% data.frame(frontier = F)
if (non_frontiers == T) {
  edgelist_borders <- egdelist_frontier %>% rbind(egdelist_nonfrontier)
}
else {
  edgelist_borders <- egdelist_frontier
}
data.for.borders <- frontier_model$data %>% mutate(phi = frontier_model$phi[["Median"]]) %>% 
  select(id, phi)
edgelist <- data.frame(id = data.for.borders$id[edgelist_borders$col], 
                       id.1 = data.for.borders$id[edgelist_borders$row], phi = data.for.borders$phi[edgelist_borders$col], 
                       phi.1 = data.for.borders$phi[edgelist_borders$row])


## Check edgelist
edgelist %>% str
frontier_model %>% summary
## above is correct


if (edgelistOnly == T) {
  return(edgelist)
}
x <- proc.time()
zones1 <- data.for.borders[edgelist_borders$col, ] %>% st_geometry()
zones2 <- data.for.borders[edgelist_borders$row, ] %>% st_geometry()
borders_geomlist <- purrr::map2(zones1, zones2, st_intersection)

border_sfc <- st_sfc(borders_geomlist)
st_geometry(edgelist) <- border_sfc
st_crs(edgelist) <- st_crs(data.for.borders)


borders.sf <- edgelist
print(proc.time() - x)
borders.sf$frontier <- edgelist_borders$frontier



### [ISSUE found]: this geometry collect is janky; also this line need to be taken out
# borders.sf <- st_collection_extract(borders.sf, type = "LINE")# this line is superfluous 

## [Solution] -- 
##  1. fix frontier_as_Sf to get rid of creating geom collect 
##  2. Buffer the polygons in the model by 1m to make sure intersections happen 
##  This doesn't affect the underlying model but fixes the visual display
## Example: insert
## frontier_model$data <- sfModels$cob_model$data %>% st_buffer(1)



if (convert2Line) {
  borders.sf <- st_collection_extract(borders.sf, type = "LINE")
  borders.sf <- borders.sf %>% group_by(id, id.1, phi, 
                                        phi.1) %>% summarise(hotfix = T) %>% ungroup %>% 
    select(-hotfix)
}
class(borders.sf) <- c("frontier_sf", class(borders.sf))
return(borders.sf)
}


# [END] debug -------------------------------------------------------------




## extracting all borders may take a while
sfBorders <-
  frontier_as_sf(
    sfModels$cob_model,
    non_frontiers = T,
#    method = 'forLoop',
    silent = T
  )



# [ISSUE] not every border gets extracted by the routine ------------------


# not every border is here!
sfModels$cob_model %>% summary
sfBorders %>% nrow


# [end issue --------------------------------------------------------------




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
