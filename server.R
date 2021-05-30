library(shiny)
library(datasets)


shinyServer(function(input, output) {

  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })

  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })

  # Generate a plot of the requested variable against mpg and only 
  # include outliers if requested
  output$mpgPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = mpgData,
            outline = input$outliers)
  })
  sliderValues <- reactive({
      #Compose data frame
      data.frame(
          Name =c("Integer"),
          Value = as.character(c(input$integer)),
          stringsAsFactors = FALSE)
  })
  # Show the values using an HTML table
  output$values <- renderTable({
    sliderValues()
  })
})