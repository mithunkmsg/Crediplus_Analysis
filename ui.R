library(shiny)
library(dygraphs)
library(xts)


mydata<-read.csv("memberships_user2.csv")
mydata2<-read.csv("not_mem_user3.csv")

shinyUI(
  pageWithSidebar(
    titlePanel(div(h4("TREND GRAPH IN DIFFERENT WEEK", align = "center"), style = "color:red"),windowTitle = "Trend Analysis"),
    
    sidebarPanel(
      dateRangeInput(inputId = "dateRange",  
                     label =  "1. Please Select a Current Date range:",
                     start = "2018-03-01",
                     end = "2018-04-01"),
      dateRangeInput(inputId = "dateRange2",  
                     label =  "2. Please Select a Previous Date range:",
                     start = "2018-01-01",
                     end = "2018-02-27")
    ),
    mainPanel(
      tabsetPanel(type="tab",
                  tabPanel("Trend graph",
                           dygraphOutput("dygraph1"),
                           h4(textOutput("legendDivID"), title = "Legend", collapsible = F, width=2),
                           br(),
                           br(),
                           dygraphOutput("dygraph2"),
                           br(),
                           br(),
                           dygraphOutput("dygraph3"),
                           h4(textOutput("legendDivID2"), title = "Legend", collapsible = F, width=2)
                  ),
                  
                  tabPanel("Data Table",
                           dataTableOutput("table")),
                  
                  tabPanel("Comparison",
                           dygraphOutput("dygraph4"),
                           h4(textOutput("legendDivID3"), title = "Legend", collapsible = F, width=2),
                           dygraphOutput("dygraph5")))
    )
  )
)

















