
library(tidyverse)
library(sf)
library(raster)
library(ncd)

test <-
  st_read('temp data/tas_hadukgrid_uk_25km_mon_201801-201812.nc')

temperature_file <- 'temp data/tas_hadukgrid_uk_25km_mon_201801-201812.nc'

test <-
  brick(temperature_file)


ttwa <- readRDS('temp data/ttwa 2011.rds') 


extract_temp <-
  extract(test, ttwa)


# extract raster squares for TTWA -----------------------------------------

names(extract_temp) <- ttwa$ttwa11nm
extract_temp[[3]] %>% str

data <- lapply(extract_temp, as.data.frame)

out_temp <- bind_rows(data, .id = 'ttwa')


# summarise ---------------------------------------------------------------

?pivot_longer

longer <- out_temp %>% pivot_longer(-ttwa)


summary <-
  longer %>% 
  group_by(ttwa, name) %>%
  summarise(
    mean_temp = mean(value, na.rm = T)
  )


# rejoin spatially --------------------------------------------------------
ttwa %>% 
  left_join(
    summary,
    by = c('ttwa11nm' = 'ttwa')
  )

?left_join
ttwa$ttwa
# done!

