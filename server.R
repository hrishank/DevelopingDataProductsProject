require(shiny)
require(ggplot2)
require(gridExtra)
data(mtcars)

fit <- lm(mpg ~ cyl + hp + wt, data = mtcars)


predictMPG <- function(cyl, hp, wt)
{
  pred <- fit$coefficients[1] + fit$coefficients[2] * cyl + 
          fit$coefficients[3] * hp + fit$coefficients[4] * wt
  return (pred)
}


shinyServer(
  function(input, output){
    predicted_mpg <- reactive({predictMPG(input$cyl, input$hp, input$wt)})
    output$prediction <- renderPrint({paste(round(predicted_mpg(), 2), "miles per gallon")})
    
    output$mpgPlot <- renderPlot({
    g1 <- ggplot(mtcars, aes(x=mpg, y=hp)) + geom_point(color = "steelblue", size = 4, alpha=1/2) + stat_smooth(method = "lm", col = "red") + labs(title = "MPG vs HP") 
    g2 <- ggplot(mtcars, aes(factor(cyl), mpg, fill = factor(cyl))) + geom_boxplot() + labs(title = "MPG vs CYL") + theme(legend.position="none")
    g3 <- ggplot(mtcars, aes(x=mpg, y=wt)) + geom_point(color = "darkgreen", size = 4, alpha=1/2) + stat_smooth(method = "lm", col = "darkgreen") + labs(title = "MPG vs WT") 
    grid.arrange(g1, g2, g3, ncol = 3)
    })    
  }
)

