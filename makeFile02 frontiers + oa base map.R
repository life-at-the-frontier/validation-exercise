## makeFile borders and frontiers + oa base

##  This script takes the model object created in the nordF project and clean it
##  Source = (measureFrontiers 03-UK-oa script)

# Input/output ------------------------------------------------------------


##  Raw files come from the UK frontiers estimation
##  model has the data; has ttwa data
## Drop the data here from the nordF project

sfModels_path <- 
  'temp data/uk-oa-03 frontier model list.rds'


## Output 
shefBase_Here <- 
  'cleaned data/makeFile02 sheffield ttwa oa.rds'

shefBorders_Here <-
  'cleaned data/makeFile02 sheffield borders+frontiers.rds'
  


## Additional library call from the socialFrontier package
library(socialFrontiers)

# 1. The areal data is in sfModels ----------------------------------------

##  Extract areal data from sheffield
sfModels <-
  sfModels_path %>% readRDS

names(sfModels)

shef_sf <-
  sfModels$Sheffield$data


##  save this to cleaned data
shef_sf %>% saveRDS(
  shefBase_Here
  )

# 2. Extract borders incld. frontiers -------------------------------------

sfModels$Sheffield %>% summary #8k borders so will takes a while!


# Hotfix ------------------------------------------------------------------
##  Change the frontier_as_sf function to have an option to extract edgelist only
sfModels$Sheffield$data %>% summary


frontier_as_sf <-
  function (frontier_model, convert2Line = T, non_frontiers = F, 
            method = "rbindlist", 
            
            ## new option
            edgelistOnly = F,
            
            silent = F) {
    data.class <- class(frontier_model)
    if (!("frontier_model" %in% data.class)) 
      stop("Not a frontier_model object; please run frontier_detect()")
    validMethods <- c("forLoop", "preAllocate", "rbindlist")
    if (!(method %in% validMethods)) 
      stop(paste("Not a valid method for extracting borders. Choose one of:", 
                 validMethods %>% paste(collapse = ", ")))
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
    data.for.borders <- 
      frontier_model$data %>% 
      mutate(phi = frontier_model$phi[["Median"]]) %>% 
      select(id, phi)
  
## Here's the additional line       
    if (edgelistOnly == T) {
      out <- 
        data.frame(
          id = data.for.borders$id[edgelist_borders$col],
          id.1 = data.for.borders$id[edgelist_borders$row],
          phi = data.for.borders$phi[edgelist_borders$col],
          phi.1 = data.for.borders$phi[edgelist_borders$row]
          )
      
      return(out)
    }
    
    x <- proc.time()
    borders_list <- list(NULL)
    for (i in 1:nrow(edgelist_borders)) {
      zone1 <- edgelist_borders$col[i]
      zone2 <- edgelist_borders$row[i]
      borders_list[[i]] <- data.for.borders[zone1, ] %>% sf::st_intersection(data.for.borders[zone2, 
      ]) %>% sf::st_cast("MULTILINESTRING")
      if (!silent & (i%%10 == 0)) {
        print(i)
      }
    }
    print(proc.time() - x)
    y <- proc.time()
    print(method %>% paste("Using", ., collapse = " "))
    if (method == "forLoop") {
      borders_sf <- do.call(rbind, borders_list)
    }
    if (method == "preAllocate") {
      n <- length(borders_list)
      borders_sf <- borders_list[[1]]
      borders_sf[n, ] <- borders_list[[n]]
      for (j in 1:n) {
        borders_sf[j, ] <- borders_list[[j]]
      }
    }
    if (method == "rbindlist") {
      borders_sf <- data.table::rbindlist(borders_list)
      borders_sf <- borders_sf %>% st_as_sf()
    }
    print(proc.time() - y)
    borders_sf$frontier <- edgelist_borders$frontier
    if (convert2Line) {
      borders_sf <- st_collection_extract(borders_sf, type = "LINE")
    }
    class(borders_sf) <- c("frontier_sf", class(borders_sf))
    return(borders_sf)
  }

# -------------------------------------------------------------------------



## extracting all borders may take a while
sfBorders <-
  frontier_as_sf(
    sfModels$Sheffield,
    non_frontiers = T,
    edgelistOnly = T,

    silent = T
  )



## adhoc (can remove without effect); save LSOA11cd
sfBorders <-
  sfBorders %>%
  mutate(
    oacd_1 = shef_sf$oa11cd[id],
    oacd_2 = shef_sf$oa11cd[id.1],
    diff_phi = abs(phi - phi.1),
    std_diff_phi = diff_phi / sd(diff_phi)
  )


# 3. Save the data --------------------------------------------------------

sfBorders %>% saveRDS(
  shefBorders_Here
)
