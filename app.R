## app.R ##
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "TOPC dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Overview", tabName = "widgets", icon = icon("th"))
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "home",
              fluidRow(
                box(plotOutput("plot1", height = 250)),
                box(
                  title = "Controls",
                  sliderInput("slider", "Number of observations:", 1, 100, 50)
                )
              )
      ),
      # Second tab content
      tabItem(tabName = "widgets",
              h2("Widgets tab content")
      )
    )
  )
)

server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}

shinyApp(ui, server)



# library(shiny)
# library(dplyr)
# library(plotly)
# 
# # Read the data from the CSV file
# cohort3FinalGov <- read.csv("~/Documents/R Projects/TOPC-impact-evaluation-dashboard/Cohort 3/cohort3FinalGov2.csv")
# 
# # Analyzing and visualizing the "q4" column
# q4_summary_df <- cohort3FinalGov %>%
#   group_by(q4) %>%
#   summarise(Frequency = n())
# 
# # Calculate total number of responses
# total_responses <- sum(q4_summary_df$Frequency)
# 
# ui <- fluidPage(
#   titlePanel("Interactive Bar Chart"),
#   plotlyOutput("plot")
# )
# 
# server <- function(input, output) {
#   output$plot <- renderPlotly({
#     p <- ggplot(q4_summary_df, aes(x = q4, y = Frequency)) +
#       geom_bar(stat = "identity", fill = "#6eaddc", width = 0.5) +
#       labs(title = paste("All respondents agree they learned skills in community research",
#                          "practices (n =", total_responses, ")."),
#            subtitle = "Rating Scale: 1 - Strongly Agree to 4 - Strongly Disagree",
#            x = "",
#            y = "Number of Responses") +
#       theme_minimal() +
#       theme(panel.grid.major.y = element_blank(),
#             panel.grid.minor.y = element_blank(),
#             plot.title = element_text(face = "bold"))
#     
#     # Convert the ggplot object to a plotly object for interactivity
#     ggplotly(p)
#   })
# }
# 
# shinyApp(ui, server)

