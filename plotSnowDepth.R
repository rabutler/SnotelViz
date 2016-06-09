library(ggplot2)
library(plotly)
library(data.table)
library(dplyr)

zz <- data.table::fread('data/sampleJanToMay.csv')

singleTS <- zz %>% filter(`Station Name` != 'Bear Lake') %>% 
  mutate(Snow.Depth = `Snow Depth (in)`) %>%
  select(Date, Snow.Depth, `Station Name`)

gg <- ggplot(singleTS, aes(x=Date, y=Snow.Depth, group = `Station Name`,color = `Station Name`)) + geom_line()
gg

ggplotly(gg)
