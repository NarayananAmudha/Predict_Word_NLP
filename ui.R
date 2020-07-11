
suppressPackageStartupMessages(c(
    library(shinythemes),
    library(shiny),
    library(tm),
    library(stringr),
    library(markdown),
    library(shinydashboard),
    library(stylo)))



## Sidebar content
sidebar <- dashboardSidebar(
    #width = 150, 
    sidebarMenu(
        menuItem("Guide", tabName = "guide",icon = icon("info-circle")),
        menuItem("Mobile App", tabName = "WordPredictor", icon = icon("mobile")),        
        menuItem("Architecture",tabName="Algo",icon = icon("th"))
        #menuItem("Guide", tabName = "guide",icon = icon("info-circle"))       
        
    )
)

body <- dashboardBody(
    
    tabItems(
    # First tab content 
    tabItem(tabName = "WordPredictor",
    fluidRow(
        column(1),
        column(width = 8,
#                tabItems(
#                    # First tab content
#                    tabItem(tabName = "WordPredictor",
                           h3("",span("Mobile device App framework to Predict next word or phrase", style = "color:#000066")),   br(),
              box(title = "", width = 100,  solidHeader = FALSE, 
        box(
            title = "Enter text here", width = NULL,status = "primary",  solidHeader = TRUE, 
            "", br(), 
            tags$style(type="text/css", "textarea {width:98%}"),
            tags$textarea(id = 'text1', placeholder = 'Type words here', rows = 3, "Wish you could enjoy this new ")
            ,tags$head(tags$style("#text1{color: blue;font-size: 18px;
                                 font-style: bold-italic;
                                 }" ) )           
          
          # uiOutput("midPanel"),
            #,br()
        ),
        
        
        box(
            title = "Click Predicted word", width = NULL,status = "primary",  solidHeader = TRUE,
            "", br(), 
            uiOutput("bottomPanel")
            #,br()
        ),
        
        box(collapsible = TRUE,
            title = "Change Settings", width = NULL, status = "primary",solidHeader = TRUE,
            sliderInput('num_bab', 'Max number of next words to predict in phrase:', min=1, max=3,value=1, step=1)
        )
#        ,box(
#             title = "Clear Text", status = "primary",  solidHeader = TRUE,
#             "", br(), 
#             uiOutput("midPanel"),br()
#         )
               )
        )
        
      )
    
    ),
# Second tab content
tabItem(tabName = "guide",
        fluidRow(
            column(width = 10,
           includeMarkdown("./about/guide.md")        
            
            )
        )
),
tabItem(tabName = "Algo",
        fluidRow(
            column(width = 9,
                   includeMarkdown("./about/algorithm.md")
            )
        )
)
)

)



dashboardPage(
    dashboardHeader(title = "Word Predictor"),    
    sidebar,
    body
)
