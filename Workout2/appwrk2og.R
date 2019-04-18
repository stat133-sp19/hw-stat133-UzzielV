#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(reshape2)


future_value <- function(amount = 100, rate = 0.05, years = 1){
  x <- amount*(1 + rate)^years
  return(x)
}

annuity <- function(contrib = 100, rate = 0.05, years = 1){
  x <- contrib*((((1+rate)^years)-1)/rate)
  return(x)
}

growing_annuity <- function(contrib = 100, rate = 0.05, growth = 0.03, years = 1){
  x <- contrib*((((1+rate)^years)-((1+growth)^years))/(rate-growth))
  return(x)
}

# Define UI for application that draws a visualization
ui <- fluidPage(
    titlePanel("Savings Options: Find what's best for you."),
    
    # Create a new Row in the UI for selectInputs
    fluidRow(
      column(4,
             sliderInput("int",
                         "Initial Amount Invested:",
                         min = 1000,
                        max = 100000,
                        value = 1000,
                        step = 500,
                        sep = ",",
                        pre = "$")),
      column(4,
             sliderInput("rte",
                         "Annual Return Rate",
                         min = 0,
                         max = 20,
                         step = 0.1,
                         value = 5,
                         post = "%")),
      column(4,
             sliderInput("yrs",
                         "Years Invested:",
                         min  = 0,
                         max = 50,
                         step = 1,
                         value = 20)),
      column(4,
             sliderInput("contr",
                         "Annual Contribution:",
                         min = 0,
                         max = 50000,
                         step = 500,
                         value = 2000,
                         pre = "$",
                         sep = ",")),
      column(4,
             sliderInput("grwth",
                         "Growth Rate",
                         min = 0,
                         max = 20,
                         step = 0.1,
                         value = 2,
                         post = "%")),
      column(4,
             selectInput("fct",
                         "Facet?",
                         c("No","Yes")))
             
 ),
 h4('Timelines'),
 plotOutput("save_graph"),
 h4('Balances'),
 verbatimTextOutput("rwdata")
)

   
  # Load the ggplot2 package which provides
  # the 'mpg' dataset.

# Define server logic required to draw visualization 
server <-  function(input, output) {

  
  modalities <- reactive({
    #we should no longer need one data frame for method:
    #we should now be able to pass the values from the slider
    #into the function below to give a all tables/graphs we need
    #We need a column that says year, and one column that says type
    # Step 1: Make an empty data frame with the correct size for the data
    modalities <- data.frame(year = 0:input$yrs, no_contrib = rep(input$int,input$yrs+1), 
                                  fixed_contrib = rep(input$int,input$yrs+1), 
                                  growing_contrib = rep(input$int,input$yrs+1))
    
    #Step 2: Define the parameters
    amnt1 = input$int
    amnt2 = input$contr
    yrs = 1:input$yrs
    rate = input$rte * .01
    grwth = input$grwth * .01
    no_contrib = c()
    no_contrib[1] = input$int
    for(year in yrs){
      no_contrib = future_value(amnt1,rate,year)
      modalities$no_contrib[year+1] = no_contrib
      
      fixed_contrib = annuity(amnt2,rate,year)
      modalities$fixed_contrib[year+1] = fixed_contrib + no_contrib
      
      growing_contrib= growing_annuity(amnt2,rate,grwth,year)
      modalities$growing_contrib[year+1] = growing_contrib + no_contrib
    }
    return(modalities)
  })  
  
  modalities2 <- reactive({ melt(modalities(), id.vars = 'year',  variable.name = 'returns')
  
  })
  
  output$save_graph <- renderPlot({
    if(input$fct == "Yes") {
      ggplot(data = modalities2(), aes( x = year, y = value, group = returns, col = returns))+
        geom_line()+
        geom_area(aes(fill= returns), alpha = 0.4)+
        geom_point(size = 1)+
        facet_wrap(~returns)+
        labs(title = 'Three Modes of Investing',x = 'Years', y = 'Return Value (Dollars)')+
        theme_bw()
    }
    else{
      ggplot(data= modalities2(), aes(x = year, y = value, group = returns, col = returns)) +
        geom_line() +
        geom_point( size=1.2)+
        labs(title = 'Three Modes of Investing',x = 'Years', y = 'Return Value')
    }
  })
  
  output$rwdata <- renderPrint({modalities()
    
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

