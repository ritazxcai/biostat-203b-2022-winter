#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#



# Load packages ----
library(shiny)
library(dplyr)


# Load data ----
icu_cohort <- readRDS("icu_cohort.rds")


# User interface ----
ui <- fluidPage(
  
  # Title Panel
  titlePanel("Mimic ICU Cohort"),
  hr(),
  br(),
  
  # Side Bar Panel  
  sidebarPanel(
    helpText("Exploring the mimic ICU cohort with graphical and numerical 
             summaries"),
    selectInput("demographic",
                "Select the demographics you are interested in:",
                choices = c("Ethnicity",
                            "Age",
                            "Gender",
                            "Insurance",
                            "Language",
                            "Marital Status"),
                selected = "Ethnicity"),
    selectInput("lab",
                "Select the lab measurement you are interested in:",
                choices = c("White Blood Cells Count",
                            "Calcium",
                            "Bicarbonate",
                            "Chloride",
                            "Creatinine",
                            "Glucose",
                            "Magnesium",
                            "Potassium",
                            "Sodium",
                            "Hematocrit"),
                selected = "White Blood Cells Count"),
    selectInput("vital",
                "Select the vital measurement you are interested in:",
                choices = c("Respiratory Rate",
                            "Heart Rate",
                            "Non Invasive Blood Pressure systolic",
                            "Non Invasive Blood Pressure mean",
                            "Temperature in Fahrenheit"),
                selected = "Respiratory Rate"),
    hr(),
    sliderInput("bins",
                "Select the number of bins:",
                min = 20, max = 100, value = 50)),
  
  # Main Panel
  mainPanel(
    plotOutput("demographicPlot"),
    plotOutput("labPlot"),
    plotOutput("vitalPlot"),
    verbatimTextOutput("summary")
  )
)



# Define server logic required to draw histograms
server <- function(input, output) {
  
  output$demographicPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    demo <- switch(input$demographic,
                   "Ethnicity" = "ethnicity",
                   "Age" = "age_adm",
                   "Gender" = "gender",
                   "Insurance" = "insurance",
                   "Language" = "language",
                   "Marital Status" = "marital_status")
    
    
    # draw the histogram with the specified number of bins
    ggplot(icu_cohort, aes_string(demo)) +
      geom_bar(stat = "count", fill = "thistle4") +
      theme(plot.background = element_rect(fill = "grey"))
  })
  
  output$labPlot <- renderPlot({
    lab <- switch (input$lab,
                   "White Blood Cells Count" = "wbc",
                   "Calcium" = "calcium",
                   "Bicarbonate" = "bicarbonate",
                   "Chloride" = "chloride",
                   "Creatinine" = "creatinine",
                   "Glucose" = "glucose",
                   "Magnesium" = "magnesium",
                   "Potassium" = "potassium",
                   "Sodium" = "sodium",
                   "Hematocrit" = "hematocrit")
    
    # draw the histogram with the specified number of bins
    ggplot(icu_cohort, aes_string(lab)) +
      geom_histogram(bins = input$bins, fill = "slategray3") +
      theme(plot.background = element_rect(fill = "grey"))
  })
  
  output$vitalPlot <- renderPlot({
    vital <- switch (input$vital,
                     "Respiratory Rate" = "RR",
                     "Heart Rate" = "HR",
                     "Non Invasive Blood Pressure systolic" = "NBPs",
                     "Non Invasive Blood Pressure mean" = "NBPm",
                     "Temperature in Fahrenheit" = "Temp_F")
    
    # draw the histogram with the specified number of bins
    ggplot(icu_cohort, aes_string(vital)) +
      geom_histogram(bins = input$bins, fill = "rosybrown3") +
      theme(plot.background = element_rect(fill = "grey"))
  })
  
  output$summary <- renderPrint({
    summary(icu_cohort)
  })
  
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)
