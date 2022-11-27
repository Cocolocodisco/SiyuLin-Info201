#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


ui <- fluidPage(

    # Application title
    titlePanel("Summary Report"),
    mainPanel(
        h2("Findings"), 
        p("We had three research questions that we aimed to answer, the first one being",
          em("Why have wildfires become a more prevalent problem now when it wasn't in the
          past?"), "When we came up with this question, we had  a few hunches, the main one
          being the ever-present issue of global warming/climate change. Due to the
          limitations of this project and the datasets we were able to find, we were not
          able to answer this question in its entirety. As we can see from our scatter plot
          graph (the third graph) in part two of our project, we are able to see a trend of
          rising temperatures throughout all regions. The increase in average temperatures
          could implicate many things, such as a longer dry season (which can implicate less
          rainfall), and higher temperatures could also lead to malfunctions and casualties
          in places that are less well-equipped to deal with rising temperatures, which can
          lead to fires."),
        p("The second research question was:", em("When in the year are fires more prevalent and
          what are the most common causes of fire (natural vs manmade)?"), "When we analyzed
          the data set and created our table for our exploratory analysis (part 2), we can
          see that debris burning is, on average, the most common cause of fire in the years
          spanning from 1992-2015. This means that even in 1992, the number one cause of
          wildfires were man made. Also from our table, we can see that fires are more
          prevalent between the months of February and August, with the most occurrences
          happening in March, according to our summary paragraph."),
        p("Our third research question was:", em("Is the prevalence of fires correlated
          with global warming, specifically the increase in the rise of average
          temperatures?"), "Due to our limited skills and time, we directly associated rising
          average temperatures with global warming, though we are aware that global warming
          brings about a lot more problems that could factor in the increased prevalence of
          wildfires. In the scatter plot, we do see that there is an upward trend, so rising
          temperatures are correlated with the increasing prevalence of fires. In the map
          (the second graph), we can see that some of the states with the most fires belong
          to Texas, California, and some of the other Southern states. When we compare the
          y-axes in the scatter plots (part three), we can tell that the Southern states
          have higher average temperatures compared to the other regions in the United
          States."),
        br(),
        h2("Discussion"),
        p("Our findings highlight two important things. First, in the span of 1992 to 2015,
          the most common cause for wildfires on average was debris burning, which is under
          the category of man made fires. This is an important thing to note because it is
          easy to write off the reasons for wildfires starting as a result of climate change
          and global warming, among other things. Though this statement is not entirely wrong,
          as wildfires do grow and burn faster in hotter and drier climates, the data shows
          that there are many wildfires that could be prevented if there were more rules
          regulating debris burning and other things that cause man made fires, for example.
          There have been many movements and campaigns to prevent the increase in man made
          fires, the most popular of which being the Smokey Bear campaign that started in 1944.
          The slogan", em("Only you can prevent forest fires,"), "became an extremely popular phrase,
          and the campaign was so successful that many Americans still recognize it, and it
          brings awareness to man made fires and what one can do to prevent them. From our data,
          we can see that campfires and fires caused by cigarettes (smoking) are drastically smaller
          than debris burning and arson, so by raising more awareness and notifying our policy
          leaders, actions can be taken and regulations established, and we may be able to prevent
          more wildfires."), 
        p("The second important point is that, in our analysis of our datasets, we have identified
          a correlation between higher temperatures and increased prevalence of wildfires. From our
          scatter plot graphs and our map, we can see that regions with higher temperatures have had
          more wildfires, on average. This situation is a little harder to address, simply because
          the effects of global warming and climate change are harder to undo and require a bigger
          combined effort to keep temperatures from rising. Global actions, like the Paris Agreement,
          aim to keep rising global warming to, ideally,  1.5 degrees Celsius. These actions could
          slow down many rising problems in the United States, like more extreme natural disasters,
          and of course, wildfires. Because fires commonly start and grow faster in hotter and drier
          places with lots of vegetation, keeping the temperatures from rising as quickly is
          imperative in making sure small fires do not grow into larger wildfires that could lower
          quality of life.")
    )

)
# Define server logic required to draw a histogram
server <- function(input, output) {


}

# Run the application 
shinyApp(ui = ui, server = server)
