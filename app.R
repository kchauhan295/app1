library(shiny)
  
ui <- fluidPage(
 sliderInput(inputId = "num",
             label = "Choose a number",
             value = 25, min = 1, max = 100),
          textInput(inputId ="title",
                    label = "Write a title",
                    value = "Histogram of Random Normal Values"),
         #textInput(inputId ="xtitle",
                 #  label = "Write a title",
                 #  value = "X-axis title"),
 
 plotOutput("hist"),
# verbatinTextOutput("stats")
)
server <- function(input, output){
  #data <- reactive ({rnorm(input$num)
    #})
  output$hist <- renderPlot({
    hist(rnorm(input$num), main = input$title)
  })
  #output$hist <- renderPlot({
   # hist(data())
  #})
    #  main = input$title,)
 # output$stats <- renderPrint({
  #  summary(data())
  #})
}

shinyApp(ui = ui, server = server)


library(shiny)
library(shiny.users)

demo_users <- list(
  list(
    username = "demo-appsilon", 
    password_sha256 = "A7574A42198B7D7EEE2C037703A0B95558F195457908D6975E681E2055FD5EB9", 
    roles = list("basic", "admin")
  ),
  list(
    username = "john", 
    password_sha256 = "C2F77349B4D0CDE5A1E865195A9E395E1DF8829BE9D31707BD12F44CEB384A60", 
    roles = list("basic")
  )
)

ui <- shinyUI(fluidPage(
  div(class = "container", style = "padding: 4em",
      login_screen_ui('login_screen'),
      uiOutput("authorized_content")
  )
))

server <- shinyServer(function(input, output) {
  users <- initialize_users(demo_users)
  callModule(login_screen, 'login_screen', users)
  
  output$authorized_content <- renderUI({
    if (!is.null(users$user()) {
      ... # application content
    }
  })
})
  
  shinyApp(ui, server)