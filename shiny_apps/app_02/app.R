# Bar Chart Explorer (app.R)
library(shiny)
library(ggplot2)

# UI Component
ui <- fluidPage(
  titlePanel("Bar Chart Explorer"),
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("species", "Select Species:", 
                         choices = unique(iris$Species), 
                         selected = unique(iris$Species))
    ),
    mainPanel(
      plotOutput("barChart")
    )
  )
)

# Server
server <- function(input, output) {
  output$barChart <- renderPlot({
    filtered_data <- iris[iris$Species %in% input$species, ]
    ggplot(filtered_data, aes(Species)) +
      geom_bar(fill = "steelblue") +
      labs(title = "Species Count", x = "Species", y = "Count")
  })
}

# Run the App
shinyApp(ui = ui, server = server)
