## app.R ##
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "TOPC Dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Overview", tabName = "overview", icon = icon("dashboard")),
      menuItem("Executive Summary", tabName = "executiveSummary", icon = icon("briefcase")),
      menuItem("Recommendations", tabName = "recommendations", icon = icon("thumbs-up")),
      menuItem("Cohort 3 Insights", tabName = "cohort3Insights", icon = icon("binoculars")),
      menuItem("Methodology", tabName = "methodology", icon = icon("flask")),
      menuItem("Discussion", tabName = "discussion", icon = icon("comments")),
      menuItem("Limitations", tabName = "limitations", icon = icon("exclamation-triangle")),
      menuItem("Appendix", tabName = "appendix", icon = icon("book")),
      menuItem("References", tabName = "references", icon = icon("bookmark"))
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "overview",
              h2("Overview")
      ),
      # Second tab content
      tabItem(tabName = "executiveSummary",
              h2("Executive Summary")
      ),
      # Third tab content
      tabItem(tabName = "recommendations",
              h2("Recommendations")
      ),
      # Fourth tab content
      tabItem(tabName = "cohort3Insights",
              h2("Cohort 3 Insights")
      ),
      # Fifth tab content
      tabItem(tabName = "methodology",
              h2("Methodology")
      ),
      # Sixth tab content
      tabItem(tabName = "discussion",
              h2("Discussion")
      ),
      # Seventh tab content
      tabItem(tabName = "limitations",
              h2("Limitations")
      ),
      # Eighth tab content
      tabItem(tabName = "appendix",
              h2("Appendix")
      ),
      # Ninth tab content
      tabItem(tabName = "references",
              h2("References")
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

