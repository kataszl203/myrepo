library(shiny)
library(datasets)


shinyServer(function(input, output) {

  #Reactive value of slider (Skala)
  sliderValues <- reactive({
    data.frame(
          Name =c("Integer"),
          Value = as.character(c(input$integer)),
          stringsAsFactors = FALSE)
  })
  #Reactive value of radio buttons (Rodzaj normalizacji)
  d <- reactive({
    switch(input$dist,
           mas5 = rnorm,
           rma = runif,
           rnorm)
    dist(input$integer)
  })

  output$plot <- renderPlot({
    dist <- input$dist
    integer <- input$integer

    hist(d(),
      main = paste("r", dist, "(",integer,")", sep = ""), 
      col = "#75AADB", border = "white")
  })  
  output$summary <- renderPrint({
    summary()
  })

  output$table <- renderTable({
    sliderValues()
  })
})