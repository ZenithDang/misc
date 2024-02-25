library(WDI)
library(dplyr)

countries <-
  c("AUS",
    "ARG",
    "BRA",
    "CHL",
    "ESP",
    "GBR",
    "JPN",
    "NZL",
    "URY",
    "USA",
    "WLD")

RawData <- WDIbulk()

SeriesTime <-  RawData$`Series-Time`

CountrySerices <-
  RawData$`Country-Series` %>% filter(CountryCode %in% countries)

Series <- RawData$Series

Country <- RawData$Country  %>% filter(Country.Code %in% countries)

FootNote <- RawData$FootNote %>% filter(CountryCode %in% countries)

SeriesData <- RawData$Data %>% filter(Country.Code %in% countries)