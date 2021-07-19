library(tidyverse)

master_df <- 
  read.csv('temp data/Master Dataset.csv')

master_df$burglary

##

summary(master_df)
plot(master_df$burglary)



summary(4)
summary(master_df)
summary(master_df$burglary)
summary(test)

test %>% class
master_df %>% class
4 %>% class

### 
head(master_df)

master_df$burglary > 100


## indexing vectors
select_these <- c(1, 2, 3, 4)
select_not_these <- c(-1, -2, -3, -4)

master_df$burglary[1]
master_df$burglary[23]
master_df$burglary[select_these]
master_df$burglary[select_not_these]

##  indexing data.frames/ matrices

master_df[1:2, 1:2]
master_df[1:2, 1:3]

##master_df[row, col]
master_df[1, ]
master_df[, 1]

master_df[1, 2]

## indexing data.frame
burgOver100 <- master_df$burglary > 100

1:3
which(1:100 > 99)

which(burgOver100)

master_df[which(burgOver100), ]

## tidyverse
master_df %>%
  filter(
    burglary > 100
  )
