# #
# # This is a Shiny web application. You can run the application by clicking
# # the 'Run App' button above.
# #
# # Find out more about building applications with Shiny here:
# #
# #    http://shiny.rstudio.com/
# #
# 
# library(shiny)
# 
# # Define UI for application that draws a histogram
# ui <- fluidPage(
# 
#     # Application title
#     titlePanel("Old Faithful Geyser Data"),
# 
#     # Sidebar with a slider input for number of bins
#     sidebarLayout(
#         sidebarPanel(
#             sliderInput("bins",
#                         "Number of bins:",
#                         min = 1,
#                         max = 50,
#                         value = 30)
#         ),
# 
#         # Show a plot of the generated distribution
#         mainPanel(
#            plotOutput("distPlot")
#         )
#     )
# )
# 
# # Define server logic required to draw a histogram
# server <- function(input, output) {
# 
#     output$distPlot <- renderPlot({
#         # generate bins based on input$bins from ui.R
#         x    <- faithful[, 2]
#         bins <- seq(min(x), max(x), length.out = input$bins + 1)
# 
#         # draw the histogram with the specified number of bins
#         hist(x, breaks = bins, col = 'darkgray', border = 'white',
#              xlab = 'Waiting time to next eruption (in mins)',
#              main = 'Histogram of waiting times')
#     })
# }
# 
# # Run the application
# shinyApp(ui = ui, server = server)

# MORE INFORMATION

# library(shiny)
# library(dplyr)
# library(plotly)
# 
# # Replace 'your_data_frame' with the actual name of your data frame
# q4_summary_df <- data.frame(
#   q4 = c("Strongly Agree", "Strongly Agree", "Agree", "Disagree", "Agree"),
#   Frequency = c(10, 15, 8, 12, 7)
# )
# 
# ui <- fluidPage(
#   titlePanel("Dynamic Bar Chart"),
#   selectInput("var", "Choose a variable:", choices = unique(q4_summary_df$q4)),
#   plotlyOutput("plot")
# )
# 
# server <- function(input, output) {
#   output$plot <- renderPlotly({
#     filtered_data <- q4_summary_df %>%
#       filter(q4 == input$var)
#     
#     p <- ggplot(filtered_data, aes(x = q4, y = Frequency)) +
#       geom_bar(stat = "identity", fill = "#6eaddc", width = 0.5) +
#       labs(title = paste("Responses for", input$var),
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

############

library(shiny)
library(dplyr)
library(plotly)

# Read the data from the CSV file
cohort3FinalGov <- read.csv("~/Documents/R Projects/TOPC-impact-evaluation-dashboard/Cohort 3/cohort3FinalGov2.csv")

# Analyzing and visualizing the "q4" column
q4_summary_df <- cohort3FinalGov %>%
  group_by(q4) %>%
  summarise(Frequency = n())

# Calculate total number of responses
total_responses <- sum(q4_summary_df$Frequency)

ui <- fluidPage(
  titlePanel("Interactive Bar Chart"),
  plotlyOutput("plot")
)

server <- function(input, output) {
  output$plot <- renderPlotly({
    p <- ggplot(q4_summary_df, aes(x = q4, y = Frequency)) +
      geom_bar(stat = "identity", fill = "#6eaddc", width = 0.5) +
      labs(title = paste("All respondents agree they learned skills in community research",
                         "practices (n =", total_responses, ")."),
           subtitle = "Rating Scale: 1 - Strongly Agree to 4 - Strongly Disagree",
           x = "",
           y = "Number of Responses") +
      theme_minimal() +
      theme(panel.grid.major.y = element_blank(),
            panel.grid.minor.y = element_blank(),
            plot.title = element_text(face = "bold"))
    
    # Convert the ggplot object to a plotly object for interactivity
    ggplotly(p)
  })
}

shinyApp(ui, server)

