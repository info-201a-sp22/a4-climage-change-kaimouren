library(ggplot2)
library(plotly)
library(dplyr)

co2_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv", stringsAsFactors = FALSE)

server <- function(input, output) {
  
  output$climate_plot <- renderPlotly({
    
    filtered_df <- co2_data %>% 
      filter(country %in% input$country_selection) %>%
      filter(year >= input$time[1] & year <= input$time[2])
    

    co2_plot <- ggplot(data = filtered_df) + 
      geom_line(aes(x = year, 
                    y = co2, 
                    color = country)) +
      ggtitle(paste("CO2 Emissions for Difference Continent over Time")) +
      labs(x = "Year", y = "CO2 emissions")
    
    return(co2_plot)
  })
  
}