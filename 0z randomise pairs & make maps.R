
# Randomise pairs and save maps -------------------------------------------

#Collate in pairs
set.seed(123)
rep <- replicate(4, sample.int(2, 2)
)
?replicate
rep[,2][2]
rep
#set.seed(444)
order_id <- 
  #  sample.int(4, 4)
  1:2
typeName <- 
  letters[order_id]


pair_1 <-
  bind_rows(
    mapA %>% mutate(type = typeName[1], pair = 1),
    mapB %>% mutate(type = typeName[2], pair = 1),
  )

pair_2 <-
  bind_rows(
    mapA %>% mutate(type = typeName[1], pair = 2),
    mapC %>% mutate(type = typeName[2], pair = 2),
  )

pair_3 <-
  bind_rows(
    mapD %>% mutate(type = typeName[1], pair = 3),
    mapC %>% mutate(type = typeName[2], pair = 3),
  )

pair_4 <-
  bind_rows(
    mapE %>% mutate(type = typeName[2], pair = 4),
    mapC %>% mutate(type = typeName[1], pair = 4),
  )


tmap_mode('view')


pairMap1 <- 
  tm_shape(S61_1LZ) + 
  tm_borders(alpha = 0.5) +
  # tm_shape(base_layer) +
  # tm_fill('propFor', alpha = 0.2) +
  tm_shape(
    pair_1
  ) +
  tm_lines(lwd = 3) +
  tm_facets('type', sync = T)

pairMap2 <- 
  tm_shape(S61_1LZ) + 
  tm_borders(alpha = 0.5) +
  # tm_shape(base_layer) +
  # tm_fill('propFor', alpha = 0.2) +
  tm_shape(
    pair_2
  ) +
  tm_lines(lwd = 3) +
  tm_facets('type', sync = T)

pairMap3 <- 
  tm_shape(S61_1LZ) + 
  tm_borders(alpha = 0.5) +
  # tm_shape(base_layer) +
  # tm_fill('propFor', alpha = 0.2) +
  tm_shape(
    pair_3
  ) +
  tm_lines(lwd = 3) +
  tm_facets('type', sync = T)

pairMap4 <- 
  tm_shape(S61_1LZ) + 
  tm_borders(alpha = 0.5) +
  # tm_shape(base_layer) +
  # tm_fill('propFor', alpha = 0.2) +
  tm_shape(
    pair_4
  ) +
  tm_lines(lwd = 3) +
  tm_facets('type', sync = T)


pairMapList <-
  list(
    pairMap1,
    pairMap2,
    pairMap3,
    pairMap4
  )

pairMapList %>% saveRDS('cleaned data/Quartile maps saved.rds')
