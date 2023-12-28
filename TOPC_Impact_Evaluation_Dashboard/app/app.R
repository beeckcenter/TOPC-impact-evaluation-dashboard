## app.R ##
library(shinydashboard)

# source("~/Documents/R Projects/TOPC-impact-evaluation-dashboard/TOPC_Impact_Evaluation_Dashboard/ui/overview.R") 
# # source("ui/executiveSummary.R")
# # source("ui/recommendations.R")
# # source("ui/cohort3Insights.R") 
# # source("ui/methodology.R")
# # source("ui/discussion.R")
# source("~/Documents/R Projects/TOPC-impact-evaluation-dashboard/TOPC_Impact_Evaluation_Dashboard/ui/limitations.R")
# # source("ui/appendix.R")
# # source("ui/references.R")

ui <- dashboardPage(
  dashboardHeader(title = "TOPC Impact"),
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
      overviewUI,
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
      limitationsUI,
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