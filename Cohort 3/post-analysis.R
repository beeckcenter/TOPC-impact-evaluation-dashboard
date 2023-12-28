# Step 1- Read and prepare data
install.packages("magrittr")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("survey")
install.packages("srvyr")

library(magrittr)
library(dplyr)
library(ggplot2)
library(survey)
library(srvyr)

cohort3FinalGov <- read.csv("~/Documents/GitHub/TOPC-impact-evaluation-dashboard/Cohort 3/cohort3FinalGov2.csv")

# Step 2- Calculate and define design weights
population_counts <- c(Akron = 8, Detroit = 9, Macon = 10, Miami = 13)
sample_counts <- c(Akron = 4, Detroit = 2, Macon = 4, Miami = 3)

total_population <- sum(population_counts)
total_sample <- sum(sample_counts)

weights <- (population_counts / total_population) / (sample_counts / total_sample)
print(weights)

city_map <- list(
  "Miami-Dade County, FL" = "Miami",
  "Akron, OH" = "Akron",
  "Detroit, MI" = "Detroit",
  "Macon-Bibb County, GA" = "Macon"
)

cohort3FinalGov$city_mapped <- unlist(lapply(cohort3FinalGov$q3, function(x) city_map[[x]]))
cohort3FinalGov$weights <- weights[cohort3FinalGov$city_mapped]
my_survey_design <- as_survey_design(cohort3FinalGov, weights = ~weights)

# Step 3- Define and apply agreement weights
weight_mapping <- c("Strongly agree" = 4, "Agree" = 3, "Disagree" = 2, "Strongly disagree" = 1)

cohort3FinalGov$WeightedValue <- dplyr::case_when(
  cohort3FinalGov$q4 == "Strongly agree" ~ 4,
  cohort3FinalGov$q4 == "Agree" ~ 3,
  cohort3FinalGov$q4 == "Disagree" ~ 2,
  cohort3FinalGov$q4 == "Strongly disagree" ~ 1,
  TRUE ~ NA_real_ # Handle any unmatched cases
)

# Step 4- Calculate weighted summary statistics






# Step 5- Visualizations
# Single-variable frequency plot
q4_frequency <- svytable(~q4, design)
# ... [Your existing code for the plot] ...

# Cross-tabulation with cities
q4_cross_tab_city <- svytable(~q4 + city_mapped, design)
# ... [Your existing code for the plot] ...


