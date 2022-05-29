library(ggplot2)
library(dplyr)
library(stringr)
climate_df <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv", stringsAsFactors = FALSE)

options(scipen=100, digits=4)

summary <- list()
#world emission
summary$co2_emis <- climate_df %>%
  filter(year == max(year)) %>%
  filter(country == "World") %>%
  pull(co2)
#max continent emission
summary$co2_emis_year_state <- climate_df %>%
  filter(year == max(year)) %>%
  filter(country != "World") %>%
  filter(co2 == max(co2,na.rm = TRUE)) %>%
  pull(country)

summary$co2_emis_year_state_max <- climate_df %>%
  filter(year == max(year)) %>%
  filter(country != "World") %>%
  filter(co2 == max(co2,na.rm = TRUE)) %>%
  pull(co2)

summary$co2_emis_year_min <- climate_df %>%
  filter(year == max(year)) %>%
  filter(country == "Oceania") %>%
  pull(co2)

summary$co2_country_Asia <- climate_df %>%
  filter(country == "Asia") %>%
  summarize(co2 = mean(co2, na.rm = TRUE)) %>%
  pull(co2)

summary$co2_country_Oceania <- climate_df %>%
  filter(country == "Oceania") %>%
  summarize(co2 = mean(co2, na.rm = TRUE)) %>%
  pull(co2)

summary$co2_country_Nort <- climate_df %>%
  filter(country == "North America") %>%
  summarize(co2 = mean(co2, na.rm = TRUE)) %>%
  pull(co2)

summary$co2_country_Sout <- climate_df %>%
  filter(country == "South America") %>%
  summarize(co2 = mean(co2, na.rm = TRUE)) %>%
  pull(co2)

summary$co2_country_Euro <- climate_df %>%
  filter(country == "Europe") %>%
  summarize(co2 = mean(co2, na.rm = TRUE)) %>%
  pull(co2)

