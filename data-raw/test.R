## This is data from

library(dplyr)
library(tidyverse)

d <- readr::read_csv('voicedinitial.txt', header=TRUE) %>%
  tbl_df() %>%
  mutate(Subject = factor(Subject)) %>%
  mutate(VOT = VOT * 1000)
