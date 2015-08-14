library(shiny)
library(shinythemes)

# Define UI for application
shinyUI(fluidPage(
  
  theme = shinytheme('journal'), 
  
  # main panel
  mainPanel(width = 12,
      
    # spacing
    fluidRow(HTML('<p><h3>Micromap Shiny Application</h3></p>')),
    
    #spacing
    fluidRow(HTML('<p></p>')),
      
          
    # first row of plots
    fluidRow(
      
      column(width = 3, 
        radioButtons(inputId = 'pantype', 
          label = h4('Panel type'),
          choices = c('dot', 'bar'),
          selected = c('dot'), 
          inline = TRUE
          )
        ),
      
      column(width = 3,
        radioButtons(inputId = 'medval', 
          label = h4('Median value?'),
          choices = c('yes', 'no'),
          selected = c('yes'), 
          inline = TRUE
          )
        ),
      
      column(width = 3, 
        numericInput("grps", 
          label = h4("Groupings"), 
          value = 5, 
          min = 1, 
          max = 50
          )
        ),
      
      column(width = 12, 
        
        plotOutput("p1", width = '1000px', height = '750px')
        
        )
      
      ) 
    
    )
        
))