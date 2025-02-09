# Load necessary libraries
library(shiny)
library(ggplot2) # for plotting

# Load the data 
boston_df <- read.csv("../../data/boston_housing.csv")

# Define UI for the app
ui <- fluidPage(
  titlePanel("Boston Housing Data Explorer"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("xvar", "Choose a variable for Scatter Plot:",
                  choices = names(boston_df)[-14], # Excluding 'medv' as it's the dependent variable
                  selected = "RM"),  # Default selection
      selectInput("box_var", "Choose a variable for Box Plot:",
                  choices = names(boston_df), selected = "MEDV"),
      checkboxInput("show_hist", "Show Histogram of MEDV", FALSE)
    ),
    
    mainPanel(
      plotOutput("scatterPlot"),
      plotOutput("boxPlot"),
      plotOutput("histPlot")
    )
  )
)

# Define server logic for the app
server <- function(input, output) {
  
  # Scatter Plot: Selected variable vs Median House Value (medv)
  output$scatterPlot <- renderPlot({
    ggplot(boston_df, aes_string(x = input$xvar, y = "MEDV")) +
      geom_point(color = "blue", alpha = 0.6) +
      geom_smooth(method = "lm", col = "red", se = FALSE) +
      labs(title = paste("Scatter Plot of", input$xvar, "vs Median House Value"),
           x = input$xvar, y = "Median House Value (MEDV)") +
      theme_minimal()
  })
  
  # Box Plot of MEDV by Categorical Variable
  output$boxPlot <- renderPlot({
    ggplot(boston_df, aes_string(y = input$box_var)) +
      geom_boxplot(fill = "lightgreen", color = "darkgreen") +
      labs(title = paste("Box Plot of Median House Value by", input$box_var),
           x = input$box_var) +
      theme_minimal()
  })
  
  # Histogram of MEDV
  output$histPlot <- renderPlot({
    if (input$show_hist) {
      ggplot(boston_df, aes(x = MEDV)) +
        geom_histogram(binwidth = 5, fill = "skyblue", color = "black", alpha = 0.7) +
        labs(title = "Histogram of Median House Value (MEDV)",
             x = "Median House Value", y = "Frequency") +
        theme_minimal()
    }
  })
}

# Run the app
shinyApp(ui = ui, server = server)
