library(shiny)
library(markdown)
library(leaflet)
library(tidyverse)
library(shinythemes)
library(plotly)

fire_data <- read.csv("./fire_data_double.csv")
unitedstate <- read.csv("./united_states_double.csv")

intro_tab <- tabPanel(
    titlePanel("Introduction"),
    sidebarLayout(
        sidebarPanel(
          includeMarkdown("./about.md")
        ),
        mainPanel(
            includeMarkdown("intro.md"),
            imageOutput("image"),
            p("Picture Credits: World Health Organization")
        )
    )
)

bar_tab <- tabPanel(
  titlePanel("Top Causes of Fire"),
  sidebarLayout(
    sidebarPanel(
      selectInput("year",
                  "Year",
                  c(sort.int(unique(fire_data$disc_pre_year)))
      )
    ),
    mainPanel(
      plotlyOutput("bar"),
      p("This bar chart shows the top causes of wildfire ranked by the most
        common cause. Users can pick a year from the dropdown menu on the left
        to see some of the most common initial causes of wildfire in that year.
        As we can see from the interactions, as the years progress, the number
        of fires increases dramatically. In the year 1991, there were only 24 cases
        of debris burning in the United states, but in 2015, we can see that there
        were 570 wildfires started due to debris burning in 2015 (and this count
        does not include other wildfires started from different causes).")
    )
  )
)

map_tab <- tabPanel(
  titlePanel("Fires Map"),
  sidebarLayout(
    sidebarPanel(
      selectInput("cause",
                  "Initial Cause of Wildfire",
                  c(unique(fire_data$stat_cause_descr))
      )
    ),
    # Show a plot of the generated distribution
    mainPanel(
      leafletOutput("map"),
      p("This graph shows different wildfires that have happened between the
        years 1992 and 2015 in the United States, including Alaska and Hawaii.
        The dropdown menu on the left lets the user choose an initial cause of
        the wildfire, and the map will display all the wildfires that started from
        that initial cause on the map.")
    )
  )
)

# user can select State, Year, use data from united_states.csv
scatterplot_tab <- tabPanel(
  titlePanel("Temperature Comparison"),
  sidebarLayout(
    sidebarPanel(
      selectInput("state",
                  "State 1 (Red)",
                  c(unique(unitedstate$State))
      ),
      selectInput("state2",
                  "State 2 (Blue)",
                  c(unique(unitedstate$State))
      ),
      selectInput("state3",
                  "State 3 (Green)",
                  c(unique(unitedstate$State))
      ),
      sliderInput("year_slider",
                  "Year Range",
                  min = 1995,
                  max = 2020,
                  value = c(1995, 2020)
      )
    ),
    # Show a plot of the generated distribution
    mainPanel(
      plotlyOutput("scatterplot"),
      p("This graph shows the average temperature of three states in the United States
        from 1992 to 2015. The dropdown menu on the left lets the user choose three states
        and the color of the line. The slider on the left lets the user choose the year range
        of the data. The graph will display the average temperature of the three states in the
        chosen year range.")
    )
  )
)

report_tab <- tabPanel(
    titlePanel("Conclusion"),
    mainPanel(
        tabsetPanel(
        tabPanel("Takeaways", includeMarkdown("takeaways.md")),
        tabPanel("Findings & More", includeMarkdown("findings.md"))
        )
    )
)

shinyUI(navbarPage(
    theme = shinytheme("united"),
    "Wildfire Data",
    intro_tab,
    bar_tab,
    map_tab,
    scatterplot_tab,
    report_tab
))
