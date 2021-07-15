##  common-00-utils

## 0. Preamble ----

library(tidyverse)
library(tmap)
library(sf)

##  Hotfix latest sf has issues with tmap -- use this fix
## see:  https://github.com/mtennekes/tmap/issues/571
##  and solution to disable S2: https://github.com/mtennekes/tmap/issues/577

sf::sf_use_s2(FALSE)
