# program:     QBS 181: plot_data_rshiny
# author:      Chris Leggett
# date:        2023-11-06
# purpose:     RShiny app to interactively plot cases

library(ggplot2)
library(dplyr)
library(tidyverse)
library(rprojroot)
library(shiny)

# Get dataset
project_path   <- find_rstudio_root_file()
rawdata_path   <- paste0(project_path, "/raw_data/")
data_path      <- paste0(project_path, "/data/")
cleandata      <- readRDS(file = paste0(data_path,"cleandata.rds")) %>%
     select(Date,Country,Cases,Deaths,New_Cases) %>%
     rename(Incident_Cases = New_Cases,
            Cumulative_Cases = Cases) 


# Define app User Interface
ui = fluidPage(

     # define selector for country
     selectInput("picked_country", "Select Country", choices = c("China", "Hong Kong", "Singapore",
                                                               "Hong Kong", "Taiwan", "Canada",
                                                               "USA", "Philippines", "Germany",
                                                               "Vietnam")), 
     
     # define selector for y-axis variable
     selectInput("picked_variable", "Select Variable", choices = c("Cumulative_Cases","Deaths","Incident_Cases")), 

     
     # define selector for date range
     sliderInput("date_selector",
                 "Select Date Range",
                 min = as.Date("2003-03-17","%Y-%m-%d"),
                 max = as.Date("2003-07-11","%Y-%m-%d"),
                 value= c(as.Date("2003-03-17","%Y-%m-%d"), as.Date("2003-07-11","%Y-%m-%d")),
                 timeFormat="%Y-%m-%d"),
     
      plotOutput("trend")
)



# Define app behavior
server = function(input, output, session){
 
     # Refine plot data based on user input
      selected <- reactive(filter(cleandata, Country %in% input$picked_country &
                                       Date >= input$date_selector[1] &
                                       Date <= input$date_selector[2] ))
         
     # Generate plot 
     output$trend = renderPlot({
          
          p <- ggplot(selected(), aes(x = Date, y = get(input$picked_variable))) +
                    geom_point(color = "steelblue3") +
                    theme_classic() + 
                    ggtitle(input$picked_country) +
                    expand_limits(y= 0) +
                    labs(x = NULL, y = input$picked_variable)
          print(p, vp=grid::viewport(gp=grid::gpar(cex=2)))
          
     })
}

# Launch app
shinyApp(ui=ui, server=server)

