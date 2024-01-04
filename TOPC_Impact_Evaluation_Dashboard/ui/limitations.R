# limitations.R
limitationsUI <- tabItem(tabName = "limitations",
                      h2("Limitations"),
                      h4("The pre-test and post-test survey questions are conceptually aligned but not directly comparable in terms of measurement scales and language of questions. 
              The pre-test uses a 4-point Likert scale focused on agreement, while the post-test uses a 5-point scale assessing expertise levels. This difference in scales means a direct comparison or change analysis (like a t-test) is not straightforward.
              However, both sets of questions target similar skills and experiences. 
              To assess changes, I looked at shifts in distribution of responses, using non-parametric methods or descriptive statistics to compare before and after without inferring statistical significance based on the Likert scale points. 
              Qualitative analysis of open-ended responses also provided some insights into changes in participants' experiences and perceptions."))
