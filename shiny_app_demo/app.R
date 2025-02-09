library(bslib)
library(shiny)

# Define UI for the Temperature Converter app
ui <- fluidPage(
  titlePanel("Temperature Converter"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("temp_input", "Temperature:", value = 0),
      selectInput("temp_scale", "Select scale:", 
                  choices = c("Celsius to Fahrenheit", "Fahrenheit to Celsius")),
      actionButton("convert", "Convert")
    ),
    
    mainPanel(
      textOutput("result")
    )
  )
)

# Define server logic for the Temperature Converter
server <- function(input, output) {
  observeEvent(input$convert, {
    if (input$temp_scale == "Celsius to Fahrenheit") {
      result <- (input$temp_input * 9/5) + 32
      output$result <- renderText({ 
        paste(input$temp_input, "°C =", round(result, 2), "°F")
      })
    } else {
      result <- (input$temp_input - 32) * 5/9
      output$result <- renderText({ 
        paste(input$temp_input, "°F =", round(result, 2), "°C")
      })
    }
  })
}

# Run the app
shinyApp(ui = ui, server = server)