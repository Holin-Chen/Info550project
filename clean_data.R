#! /usr/local/bin/Rscript

library(RCurl)
library(dplyr)


#make clean data
a <- read.csv(text=getURL("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv"),header=T)


## Data cleaning and manipulation

aa <- a %>%
  as_tibble %>%
  filter(cases > 100) %>%
  group_by(state) %>%
  mutate(days_since_100 = as.numeric(as.Date(date) - min(as.Date(date)))) %>%
  ungroup

  # save data
write.csv(aa, "clean_data.csv", quote = FALSE, row.names = FALSE)
