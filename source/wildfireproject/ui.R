#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(markdown)
#source("./findings.R")

# Define UI for application that draws a histogram

page_one <- tabPanel(
    titlePanel("Introduction")
)

page_two <- tabPanel(
    titlePanel("Interactive Map")
)
page_three <- tabPanel(
    titlePanel("Findings, Discussion, Conclusions"),
        mainPanel( 
           includeMarkdown("findings.md")
        )
)

shinyUI(navbarPage(
    "Wildfire Data & Summary",
    page_one,
    page_two,
    page_three
))
