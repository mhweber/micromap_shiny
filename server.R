# This is the server logic for a Shiny web application.

library(shiny)
library(micromap)

data(edPov)
data(USstates)

shinyServer(function(input, output) {
   
  output$p1 <- renderPlot({
    
    pantype <- input$pantype
    medval <- input$medval
    if(medval == 'yes') medinp <- T
    else medinp <- F
    grps <- input$grps
    
    statePolys <- create_map_table(USstates, 'ST')
    
    ### draft micromap plot figure 1
    mmplot(stat.data = edPov,
           map.data = statePolys,
           panel.types = c('labels', pantype, 'dot', 'map'),
           panel.data = list('state', 'pov', 'ed', NA),
           ord.by = 'pov',   
           grouping = grps, median.row = medinp,
           map.link = c('StateAb','ID'))
    
  })
  
})
