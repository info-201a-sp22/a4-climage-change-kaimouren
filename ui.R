library(plotly)
library("bslib")
library(dplyr)
library(knitr)
library(rsconnect)


climate_df <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv", stringsAsFactors = FALSE)

my_theme <- bs_theme(bg = "#101010",
                     fg = "#FDF7F7",
                     primary = "#ED79F9"
)


intro_tab <- tabPanel(
  "Introduction",
  fluidPage(
    p("As the greenhouse effect intensifies, more and more people are becoming aware of environmental issues. The main reason for the increase of the greenhouse effect is the increase of carbon dioxide emissions. So I want to use this app to let more people know how CO2 emissions have changed from the past to the present on each continent, so that they can know where to pay more attention to the environment."),
    h2("Summary"),
    p("By looking at the data set, we can see that the column of countries in the data contains a variety of data, including continents, countries, etc. In order to draw better and more comprehensive conclusions about CO2 emissions, I choose to use continents as the unit for analysis."),
    p("In 2019, the world's total CO2 emissions are 34807.259. Among them, Asia has the highest emissions of 20317.058. And Oceania is the least, with only 444.571`. Meanwhile, by calculating the data for all years, I get that the average CO2 emissions are 3153.35 in Asia,1959.9845 in Europe,2024.5846  in North America,315.976` in South America and 130.3186 in Oceania."),
    p("Also this data has some limitations. In the column of countries, there are not only countries, but also continents with different income regions, etc. This haphazard grouping can often make it difficult to form a valid table because of the possibility of missing some rows. It is also true that some data from earlier years may have an impact on the calculation results, as the missing data may be large or small, and thus affect the conclusions drawn."),
  )
)

sidebar_panel_widget <- sidebarPanel(
  selectInput(
    inputId = "country_selection",
    label = "Continent Name",
    choices = c("Asia",
                "North America",
                "South America",
                "Africa",
                "Oceania",
                "Europe"),
    multiple = TRUE,
    selected = "North America"
  ),
  sliderInput(inputId = "time",
              label = h3("Year"),
              min = min(climate_df$year),
              max = max(climate_df$year),
              sep = "",
              value = c(min(climate_df$year),max(climate_df$year)))
)
main_panel_plot <- mainPanel(
  plotlyOutput(outputId = "climate_plot")
)

climate_tab <- tabPanel(
  "Climate Viz",
  sidebarLayout(
    sidebar_panel_widget,
    main_panel_plot
  ),
  h3("Description"),
  p("This table is about the variation of CO2 emissions with year. The user can see the CO2 emissions curve for different continents by selecting the continent or changing the year interval to better understand the changes in the selected continent over that time period. It is also possible to see that Asia has risen rapidly since 1950, Europe and North America have fallen slowly since the 21st century, while the other three weeks have risen more but not significantly.")
)


ui <- navbarPage(
  # Select Theme
  theme = my_theme,
  # Home page title
  "Climate Change",
  intro_tab,
  climate_tab
)
