library(shiny)
library(ggplot2)

shinyServer
  (
  function(input, output)
    {
    result <- reactive(
      {
      if (input$to == input$from)
        {
        input$amt
        }
      else if (input$to == "EUR")
        {
        input$amt * 0.88
        }
      else
        {
        input$amt * 1.14
        }
      })
    
    output$text <- renderPrint({paste(input$amt, input$from, "is equal to", result(), input$to)})
    
    months <- seq(1, 23, by=1)
    rate <- c(1.3167, 1.2999, 1.3010, 1.3302, 1.3222, 1.3526, 1.3584, 1.3591, 1.3746, 1.3487, 1.3802, 1.3771, 1.3867, 1.3631, 1.3692, 1.3389, 1.3133, 1.2632, 1.2525, 1.2452, 1.2099, 1.1288, 1.1383)
    
    output$plot <- renderPlot(
      {
      qplot(months, rate, geom="line", main="USD vs EUR", xlab="Month", ylab="Exchange Rate") + scale_x_discrete(breaks=c(1, 8, 16, 23), labels=c("Apr 2013", "Nov 2013", "Jul 2014", "Feb 2015"))
      })
    }
  )