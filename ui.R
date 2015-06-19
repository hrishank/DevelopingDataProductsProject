require(shiny)
data(mtcars)
shinyUI(
  fluidPage(
    #Application Title
  titlePanel('Predict mpg of a car from the mtcars dataset'), 
  sidebarPanel(
    h3('Please enter independent variables used to predict MPG below.'),
    sliderInput('wt', 'Weight (lb/1000)', 2, min = 1, max = 6, step = 0.1), 
    sliderInput('hp', 'Horsepower', 100, min = 50, max = 335, step = 5), 
    sliderInput('cyl', 'Cylinders', 4, min = 4, max = 8, step = 2), 
    submitButton('Submit')
  ), 
  mainPanel(
    h3('Results of prediction for the MPG: '), 
    verbatimTextOutput("prediction"), 
    h3('MPG vs independent variables in the mtcars data set'),
    plotOutput('mpgPlot'),
    h4('References'),
    p('Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391-411.'), 
    h4("Documentation: "), 
    h5("This app uses the mtcars data set provided by default in R and uses a linear regression model to predict "), 
    h5("the MPG value of a given car based on the horepower (HP), number of cylinders (CYL) and weight (WT) as inputs. "), 
    h5("These inputs are provided on the left and can be adjusted using the sliders. The output appears on the right "), 
    h5("once you choose the inputs and click on the Submit Button. The output changes to X miles per gallon in the box "), 
    h5("on the top left right above the graphs. The graphs are static and represent the relationships between the 3 "), 
    h5("independent variables HP, CYL, and WT and their effect on the MPG dependent variable")
  )
  )
)