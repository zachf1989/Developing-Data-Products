library(shiny)

shinyUI
  (
  pageWithSidebar
    (
    headerPanel("Currency Converter"),
    sidebarPanel
      (
      numericInput('amt', 'Amount', 1, min=1, max=100, step=1),
      selectInput('from', "From", c("USD", "EUR"), selected = NULL, multiple = FALSE, selectize = TRUE, width = NULL),
      selectInput('to', "To", c("USD", "EUR"), selected = NULL, multiple = FALSE, selectize = TRUE, width = NULL)
      ),
    mainPanel
      (
      tabsetPanel
        (
        tabPanel("App", verbatimTextOutput("text"), plotOutput('plot')),
        tabPanel("Docs", p("This application is a currency converter to/from US Dollars to Euros."), p("To use this app, you must first input the amount that you would like to convert. Then choose the currency which you are starting in. Finally, choose the currency that you would like to convert to. The result will be displayed automatically in the main panel."), p("Below the conversion, you will find a handy graph showing the conversion rate over the past several months."))
        )
      )
    )
  )