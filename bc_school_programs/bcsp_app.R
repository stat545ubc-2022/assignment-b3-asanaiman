
#Loading packages
library("shiny")
library("tidyverse")

#Loading the Dataset
bcsp <- read_csv("ProgramsOfferedinSchools.csv") %>% 
  select(-`Data Level`) %>% 
  filter(`District Number` != "NA")

#Making My Shiny App
ui <- fluidPage(
  titlePanel("Programs Offered in B.C. Schools"),
  h5("This shiny app let's you explore the different programs offered in British Columbia Schools."),
  br(),
  sidebarLayout(
    sidebarPanel(
      # Feature 1: Add a slider that lets the user filter through the district numbers and view the different programs for either a single district or a range of districts.
      sliderInput("programs_slider", "Select a district range:", min = 5, max = 625, value = c(30, 65)),
      # Feature 2: Add radio buttons so the user can filter through specific academic years rather than viewing the entire dataset.
      radioButtons("yearInput", "School Year", choices = c("2005/2006", "2006/2007", "2007/2008", "2008/2009", "2009/2010", "2010/2011",
                                                           "2011/2012", "2012/2013", "2013/2014"))),
    # Feature 3: Add a table that allows the user to view the different programs offered in BC based off of the filters they indicated in feature 1 and 2.
    mainPanel("bcsp", DT::dataTableOutput("programs_table"))))

server <- function(input, output) {
  observe(print(input$programs_slider))
  bcsp_filtered <- reactive({
    bcsp %>% 
      filter(`District Number` > input$programs_slider[1] &
               `District Number` < input$programs_slider[2] &
               `School Year` == input$yearInput)
  })
  output$programs_table <- DT::renderDataTable({
    DT::datatable(bcsp_filtered()) 
  })
  
}

shinyApp(ui = ui, server = server)