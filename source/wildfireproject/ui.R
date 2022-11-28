#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
#source("./findings.R")

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        titlePanel("Findings, Discussion, Conclusions"),

        mainPanel( 
            h2("Findings"),
            p("We had three research questions that we aimed to answer, the
              first one being", strong("Why have wildfires become a more prevalent
              problem now when it was not in the past?"), "When we came up with this
              question, we had a few hunches, the main one being the ever-present
              issue of global warming and climate change. Due to the limitations
              of this project and the datasets we were able to find, we were not
              able to answer this question in its entirety. As we can see from 
              our scatter plot graph (the third graph) in part two of our project, 
              we are able to see a trend of rising temperatures throughout all 
              regions. The increase in average temperatures could implicate
              many things, such as a longer dry season (which can implicate
              less rainfall), and higher temperatures could also lead to 
              malfunctions and casualties in places that are less well-equipped
              to deal with rising temperatures, which can lead to fires."),
            p("The second research question was", strong("When in the year are
              are fires more prevalent and what are the most common causes of 
              fires (natural vs manmade)?"), "When we analyzed the data set and 
              created our table for our exploratory analysis (part 2), we can 
              see that debris burning is, on average, the most common cause
              of fire in the years spanning 1992-2015. This means that even in 
              1992, the number one cause of wildfires were man made. Also from
              our table, we can see that fires are more prevalent between the 
              months of February and August, with the most ocurances happening
              in March, according to our summary paragraph."),
            p("Our third research question was:", strong("Is the prevalence of fires
              correlated with global warming, specifically in the increase in the 
              rise of average temperatures?"), "Due to our limited skills and time,
              we directly associated rising average temperatures with global warming,
              though we are aware that global warming brings about a lot more problems
              that could factor in the increased prevalence of wildfires. In the 
              scatterplot, we do see that there is an upward trend, so rising
              temperatures are correlated with the increasing prevalence of
              fires. In the map (the second graph), we can see that some of the
              states with the most fires belong to Texas, California, and many of 
              the Southern states. When we compare the y-axes in the scatter plot
              (part three) we can tell that the Southern states have higher
              average temperatures compared to other regions in the United States."),
            br(), 
            h2("Discussion"),
            p("Our findings highlight two important things. First, in the span of 1992
              to 2015, the most common cause for wildfires on average was debris burning, 
              which is under te category of man made fires. This is an important thing to
              note because it is easy to write off the reasons for wildfires starting as a 
              result of climate change and global warming, among other things. Though this
              statement is not entirely wrong, as wildfires do grow and burn faster in hotter
              and drier climates, the data shows that there are many wildfires that could be
              prevented if there were more rules regulating debris burning and other things that
              cause man made fires, for example. There ahve been many movements and campaigns to
              prevent more man made fires, the most popular of which being the Smokey Bear campaign
              that started in 1944. The slogan", em("Only you can prevent forest fires"), "became an
              extremely popular phrase, and the campaign was so successfull that many Americans still
              recognize it, and it brings awaremess to man made fires and what one can do 
              prevent them. From our data, we can see that campfires and fires caused by cigarettes
              (smoking) are drastically smaller than debris burning and arson, so by raising
              awareness and notifying our policy leaders, actions can be taken and regulations
              established, and we may be able to prevent more wildfires."),
            p("The second important point is that, in our analysis of our datasets, we have
              identified a correlation between higher temperatures and increased prevalence of
              wildfires. From our scatter plot graphs and our map, we can see that regions with
              higher termperatures have had more wildfires, on average. This situation is a little
              harder to address, simply because the effects of global warming and climate change
              are harder to undo and require a bigger combined effort to keep temperatures from
              rising. Global actions, like the Paris Agreement, aim to keep rising global warming
              to, ideally, 1.5 degrees Celsius. These actions could slow down many rising problems
              in the United States, like more extreme natural disasters, for example, and of course, 
              wildfires. Because fires commonly start and grow faster in hotter and drier places with
              lots of vegetation, keeping the temperatures from rising as quickly is imperative in
              making sure small fires do not grow into larger wildfires that could lower quality of
              life."),
            br(),
            h2("Conclusion"),
            p("Wildfires have been a present problem dating back to the 1800s, and with rising
              temperatures due to global warming and climate change, as well as many different
              ways to carelessly start a fire, it has stayed a problem. Even though there have
              been many efforts to prevent man made wildfires, like the iconic Smokey Bear campaign
              that started in 1944, wildfires are still extremely prevalent in today's society, and
              many Americans are affected by the resulting smoke. While some may argue that wildfires
              are encouraged to balance the vegetation ecosystem, many frequent wildfires are detrimental
              to physical health and mental health. Some examples of these include having to relocate
              due to one's house being compromised or having to breathe in smoke particles for
              prolonged periods of time."),
            p("While lightning, a natural cause of wildfires (and therefore harder to prevent), is
              the fourth most common cause for fires in the years 1992 through 2015 (in our data
              set), debris burning and arson (which are both man made fires) top the charts for the
              most common causes of wildfires. This, combied with rising temperatures due to
              global warming, increase the prevalence and prolong the existence of wildfires. While
              there are steps to combat global warming, it will not be an instantaneous change and
              may take several decades, especially with trying to change parts of the world that are
              reliant on older, more pollutant products. Also, I believet hat the correlation between
              wildfires and global warming is a little misunderstood, in the sense that people
              may believe that more wildfires are happening because temperatures are rising, in the
              same way natural disasters are more extreme due to climate change. But the truth of the
              matter is that man made fires are started, and they become uncontainable due to the dry
              season and the low rainfall. It is not necessarily the rising temperatures that start 
              fires; it is because of rising temperatures that wildfires stay fires for longer than 
              intended."),
            p("We hope, in our creation of this summary, that ways to prevent wildfires and how
              they are first started gains more attention. We hope that raising more awareness will
              help prevent future wildfires. We hope that effective campaigns regarding safety regulations
              of controlled fires and things the general public can do to make the earth a greener place
              will be carried out, and that news of major wildfires and record-breaking air quality
              indexes become few and far between. After all, you are one of the many people who can 
              prevent wildfires.")
        )
    )
)
