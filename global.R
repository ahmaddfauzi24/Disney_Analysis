#-----------import library yang dibutuhkan--------------
library(tidyverse)
library(dplyr)
library(readxl)
library(plotly)
library(lubridate)
library(stringr)
library(tidyr)
library(extrafont)
library(glue)
library(scales)
library(zoo)
library(DT)
library(shiny)
library(shinydashboard)
library(rsconnect)
library(leaflet)
library(geojsonio)
library(htmlwidgets)
library(htmltools)
library(prettydoc)
library(echarts4r)
library(countrycode)
library(shiny)
library(echarts4r)
library(countrycode)

# Import Dataset per Setiap Negara (Iraq dan Libya tidak didapatkan datasetnya)
data_disney <- read.csv("datainput/disney_plus_titles.csv")

#---------------Data Preparation-----------------------

# Melakukan cleansing data dana penyesuaian data yang dibutuhkan
data_disney$type <- as.factor(data_disney$type)
data_disney$date_added <- mdy(data_disney$date_added)
data_disney$release_year <- parse_date_time(data_disney$release_year,'y')

data_disney$director[data_disney$director==""] <- NA
data_disney$cast[data_disney$cast==""] <- NA
data_disney$country[data_disney$country==""] <- NA
data_disney$rating[data_disney$rating==""] <- NA

data_disney$director[which(is.na(data_disney$director))] <- "Missing Values"
data_disney$cast[which(is.na(data_disney$cast))] <- "Missing Values"
data_disney$country[which(is.na(data_disney$country))] <- "Missing Values"
data_disney$date_added[which(is.na(data_disney$date_added))] <- "2019-01-01" #because the date_added column has a date data type
data_disney$rating[which(is.na(data_disney$rating))] <- "Missing Values"

data_disney$year_added <- year(data_disney$date_added)
data_disney$month_added <- month(data_disney$date_added, label = T)

data_disney <- data_disney %>% separate(listed_in,c("category","category2","category3"), sep = ",")
data_disney <- data_disney %>% 
  mutate(year_added = as.factor(year_added))


# theme Algoritma
theme_algoritma <- theme(legend.key = element_rect(fill="black"),
                         legend.background = element_rect(color="white", fill="#263238"),
                         plot.subtitle = element_text(size=6, color="white"),
                         panel.background = element_rect(fill="#dddddd"),
                         panel.border = element_rect(fill=NA),
                         panel.grid.minor.x = element_blank(),
                         panel.grid.major.x = element_blank(),
                         panel.grid.major.y = element_line(color="darkgrey", linetype=2), 
                         panel.grid.minor.y = element_blank(),
                         plot.background = element_rect(fill="#263238"),
                         text = element_text(color="white"),
                         axis.text = element_text(color="white")
)