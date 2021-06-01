library(shiny)

shinyUI(fluidPage(

  titlePanel("Analiza danych mikromacierzowych"),

  sidebarLayout(
    sidebarPanel(
      radioButtons("dist", "Rodzaj normalizacji",
                   c("MAS-5" = "mas5",
                     "RMA" = "rma")),
      br(),
      sliderInput("integer", "Skala:",
                  min = 0, max = 100, value = 20),
      br(),
      checkboxInput("outliers", "Pokaż klasę poszczególnych danych", FALSE),
      br(),
      downloadButton("button", "Pobierz raport")
  ),

    mainPanel(
      tabsetPanel(
        tabPanel("Wykres", plotOutput("plot")),
        tabPanel("Podsumowanie", verbatimTextOutput("summary")),
        tabPanel("Tabela", tableOutput("table"))
        ),
    )
  )
))
