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



# [Hotfix Issue] use this code from ni-03 -------------------------------
frontier_as_sf_HOTFIX <- 
  function (frontier_model, convert2Line = T, non_frontiers = F, 
            silent = F) {
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
    borders.sf <- list(NULL)
    x <- proc.time()
    for (i in 1:nrow(edgelist_borders)) {
      zone1 <- edgelist_borders$col[i]
      zone2 <- edgelist_borders$row[i]
      borders.sf[[i]] <- data.for.borders[zone1, ] %>% 
        st_intersection(data.for.borders[zone2, ])
      
      
      
      if (!silent & (i%%10 == 0)) {
        print(i)
      }
    }
    
    borders.sf <- do.call(rbind, borders.sf)
    print(proc.time() - x)
    
    
    #    borders.sf$frontier <- edgelist_borders$frontier
    
    
    if (convert2Line) {
      borders.sf <- st_collection_extract(borders.sf, type = "LINE")
    }
    class(borders.sf) <- c("frontier_sf", class(borders.sf))
    return(borders.sf)
  }  

###### [END hotfix]


## extracting all borders may take a while
sfBorders <-
  frontier_as_sf_HOTFIX(
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
