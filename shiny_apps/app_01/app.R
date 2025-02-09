# Scatter Plot Visualizer (app.R)
library(shiny)

# UI
ui <- fluidPage(
  titlePanel("Scatter Plot Visualizer"),
  sidebarLayout(
    sidebarPanel(
      selectInput("variable", "Choose Variable for x-axis:", 
                  choices = names(mtcars), selected = "hp")
    ),
    mainPanel(
      plotOutput("scatterPlot")
    )
  )
)

# Server
server <- function(input, output) {
  output$scatterPlot <- renderPlot({
    plot(mtcars[[input$variable]], mtcars$mpg,
         xlab = input$variable, ylab = "mpg",
         main = paste("mpg vs", input$variable))
  })
}

# Run the App
shinyApp(ui = ui, server = server)
