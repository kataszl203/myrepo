library(shiny)

# Define UI for microarrays data analysis application
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Analiza danych mikromacierzowych z wykorzystaniem
   klasy ExpressionSet"),
  # Sidebar with controls to select the variable to plot against mpg
  # and to specify whether outliers should be included
  sidebarPanel(
        sliderInput("integer", "Integer:",
                min=0, max=100, value=20),
    br(),
    checkboxInput("outliers", "Pokaż klasę poszczególnych danych",
     FALSE)
  ),

  # Show a tabset that includes a plot, summary, and table view
  # of the generated distribution
  mainPanel(
    tabsetPanel(
      tabPanel("Wykres", plotOutput("plot")),
      tabPanel("Podsumowanie", verbatimTextOutput("summary")),
      tabPanel("Tabela", tableOutput("table"))
    ),
    h3(textOutput("caption")),

  )
))
