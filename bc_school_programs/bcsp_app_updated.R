# Loading packages
library("shiny")
library("tidyverse")
library("shinythemes")
library("shinyWidgets")

# Loading the Dataset
bcsp <- read_csv("ProgramsOfferedinSchools.csv") %>% 
  select(-`Data Level`) %>% 
  filter(`District Number` != "NA")

# Making Shiny App
ui <- fluidPage(
  theme = shinytheme("flatly"),
  titlePanel(strong("Programs Offered in B.C. Schools 2005-2014")),
  h5("This shiny app let's you explore the different programs offered in British Columbia Schools."),
  br(),
  helpText(strong("Filter your table by selecting the district range, school years, and facility type you want to look at:")),
  sidebarLayout(
    sidebarPanel(
      # Feature 1: Adding a slider that lets the user filter through the district numbers and view the different programs for either a single district or a range of districts.
      sliderInput("programs_slider", "Select a district range:", min = 5, max = 625, value = c(30, 65)),
      # Feature 2: Adding a check box group to allow user to filter and visualize wither a single school year or multiple.
      checkboxGroupInput("yearInput", "School Years:",
                         choices = unique(bcsp$`School Year`),
                         selected = c("2005/2006")),
      # Feature 3: Adding a picker for facility type as it can be really difficult to filter through looking for specific facility input. Picker input allows to select one or multiple options.
      pickerInput("facilityInput", "Facility Type:",
                  c("Standard" = "STANDARD",
                    "Continuing ED" = "CONTINUING ED",
                    "Alternate" = "ALTERNATE",
                    "District Distance ED" = "DISTRICT DISTANCE ED",
                    "Long Term PRP" = "LONG TERM PRP",
                    "Youth Custody" = "YOUTH CUSTODY"),
                  selected = "STANDARD", 
                  options = list(`actions-box` = TRUE, `none-selected-text` = ("Please Select Preferred Facility Type(s)")), 
                  multiple = TRUE),
      submitButton(text = "Apply Changes", icon = icon("refresh"), width = NULL),
      helpText("Click the", strong("Apply Changes"), "button for the filters you applied to be reflected in the table output.")),
    # Feature 4: Adding a table that allows the user to view the different programs offered in BC based off of the filters they indicated in feature 1 and 2.
  mainPanel("bcsp", DT::dataTableOutput("programs_table"))))


server <- function(input, output) {
  observe(print(input$programs_slider))
  bcsp_filtered <- reactive({
    bcsp %>% 
      filter(`District Number` > input$programs_slider[1] &
               `District Number` < input$programs_slider[2] &
               `School Year` %in% input$yearInput &
               `Facility Type` %in% input$facilityInput)
  })
  output$programs_table <- DT::renderDataTable({
    DT::datatable(bcsp_filtered()) 
  })
  
}

shinyApp(ui = ui, server = server)
