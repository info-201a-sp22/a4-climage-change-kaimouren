# install.packages("shiny")
library(shiny)
source("ui.R")
source("server.R")

# Change the title of the app
# Change the radio button choices
# Create an output message based on the user's response
# Bonus: add an image!

# Run the application
shinyApp(ui = ui, server = server)
