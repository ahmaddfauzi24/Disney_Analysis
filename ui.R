# Header

header <- dashboardHeader(
  title = "Disney Analysis"
)

# Sidebar

sidebar <- dashboardSidebar(
  collapsed = F,
  sidebarMenu(
    menuItem(
      text = "Overview",
      tabName = "Overview",
      icon = icon("dashboard")
    ),
    menuItem(
      text = "Popular",
      tabName = "Popular",
      icon = icon("video")
    ),
    menuItem(
      text = "Data",
      tabName = "Data",
      icon = icon("book")
    ),
    menuItem(
      text = "Source", 
      icon = icon("code"),
      href = "https://github.com/ahmaddfauzi24/Disney_Analysis"
    )
    ))

# Body

body <- dashboardBody(
  
  # using custom CSS 
  
  tags$head(tags$style(HTML('
                                 /* logo */
                                 .skin-blue .main-header .logo {
                                 background-color: #D2E9E9;
                                 color: black;
                                 font-family: "Georgia";
                                 font-style: bold;
                                 }
  
                                 /* logo when hovered */
                                 .skin-blue .main-header .logo:hover {
                                 background-image: url("disney.png") !important;
                                 background-size: cover !important;
                                 border-bottom-color:#E3F4F4;
                                 border-left-color:#E3F4F4;
                                 border-right-color:#E3F4F4;
                                 border-top-color:#E3F4F4;
                                 color: white;
                                 font-family: "Georgia";
                                 font-style: bold;
                                 }
  
                                 /* navbar (rest of the header) */
                                 .skin-blue .main-header .navbar {
                                 background-color: #D2E9E9;
                                 }
  
                                 /* main sidebar */
                                 .skin-blue .main-sidebar {
                                 background-color: #D2E9E9;
                                 font-family: "Gautami";
                                 }
  
                                 /* active selected tab in the sidebarmenu */
                                 .skin-blue .main-sidebar .sidebar .sidebar-menu .active a{
                                 background-color: #D2E9E9;
                                 border-left-color:#D2E9E9;
                                 color: #5C469C;
                                 font-family: "Georgia";
                                 font-style: italic;
                                 }
  
                                 /* other links in the sidebarmenu */
                                 .skin-blue .main-sidebar .sidebar .sidebar-menu a{
                                 background-color: #E3F4F4;
                                 border-left-color:#E3F4F4;
                                 color: black;
                                 font-family: "Georgia";
                                 font-style: italic;
                                 }
  
                                 /* other links in the sidebarmenu when hovered */
                                 .skin-blue .main-sidebar .sidebar .sidebar-menu a:hover{
                                 background-color: #D2E9E9;
                                 border-left-color:#D2E9E9;
                                 color: #D4ADFC;
                                 font-family: "Georgia";
                                 font-style: italic;
                                 }
                                 /* toggle button when hovered  */
                                 .skin-blue .main-header .navbar .sidebar-toggle:hover{
                                 background-color: black;
                                 border-left-color:#E3F4F4;
                                 }
  
                                 /* body */
                                 .content-wrapper, .right-side {
                                 background-color: #E3F4F4;
                                 font-family: "Georgia";

                                 }
                                 
                                 .box.box-solid.box-primary>.box-header {

                                 }

                                 .box.box-solid.box-primary{
                                 border-bottom-color:#E3F4F4;
                                 border-left-color:#E3F4F4;
                                 border-right-color:#E3F4F4;
                                 border-top-color:#E3F4F4;
                                 background:#E3F4F4;
                                 box-shadow: none;
                                 }
                                 
                                 .box.box-solid.box-danger{
                                 background-image: url("movietv.png") !important;
                                 background-size: cover !important;
                                 border-bottom-color:#E3F4F4;
                                 border-left-color:#E3F4F4;
                                 border-right-color:#E3F4F4;
                                 border-top-color:#E3F4F4;
                                 color: white;
                                 box-shadow: none;
                                 }
                                 
                                 .box.box-solid.box-success{
                                 background-image: url("mapp_drone.png") !important;
                                 background-size: cover !important;
                                 border-bottom-color:#E3F4F4;
                                 border-left-color:#E3F4F4;
                                 border-right-color:#E3F4F4;
                                 border-top-color:#E3F4F4;
                                 color: #D4ADFC;
                                 box-shadow: none;
                                 }
                                 
                                 .small-box.bg-black { 
                                 background-color: #5C469C !important;
                                 color: white !important; 
                                 
                                 }
                                 
                                 .small-box.bg-navy { 
                                 background-image: url("totalfilm.jpg") !important;
                                 background-size: cover !important;
                                 color: white !important;
                                 
                                 }
                                 
                                 .small-box.bg-red { 
                                 background-image: url("totalrating.jpg") !important;
                                 background-size: cover !important;
                                 color: white !important; 
                                 
                                 }
                                 
                                 .small-box.bg-yellow { 
                                 background-image: url("totalcat.jpg") !important;
                                 background-size: cover !important;
                                 color: white !important; 
                                 
                                 }
                                
                                .small-box.bg-black { 
                                 background-image: url("director.jpg") !important;
                                 background-size: cover !important;
                                 color: white !important; 
                                 
                                }
                                
                                .small-box.bg-green { 
                                 background-image: url("cast.jpg") !important;
                                 background-size: cover !important;
                                 color: white !important; 
                                 
                                 }
                                 
                                 
                                 
  
                               '))),
  
  tabItems(
    
    # TAB 1  
    tabItem(
      tabName = "Overview",
        fluidPage(
          valueBox(tags$p(length(unique(data_disney$title)), style = "font-size: 100%; color: #D4ADFC;"), 
                   tags$p("Total Unique Film", style = "font-size: 150%; color: white;"),
                   color = "navy",
                   width = 4),
          valueBox(tags$p(length(unique(data_disney$director)), style = "font-size: 100%; color: #D4ADFC;"), 
                   tags$p("Total Unique Director", style = "font-size: 150%; color: white;"),
                   color = "black",
                   width = 4),
          valueBox(tags$p(length(unique(data_disney$cast)), style = "font-size: 100%; color: #D4ADFC;"), 
                   tags$p("Total Unique Cast", style = "font-size: 150%; color: white;"),
                   color = "green",
                   width = 4),
          box(width = 12,
              height = 150,
              status = "danger", 
              solidHeader = TRUE,
              align = "center",
              checkboxGroupInput(inputId = "Film",
                                 label = h4(tags$b(" ")),
                                 choices = unique(data_disney$type),
                                 selected = levels(data_disney$type))
          )
        ),
      fluidPage(
        box(width = 12,
            status = "primary", 
            solidHeader = TRUE,
            plotlyOutput(outputId = "plot_film")),
        box(width = 12,
              solidHeader = TRUE,
              status = "warning",
              title = "Choose Year" ,
              selectInput(inputId = "input_year",
                          label = NULL,
                          choices = levels(data_disney$year_added))),
        box(width = 12,
            status = "primary", 
            solidHeader = TRUE,
            plotlyOutput(outputId = "plot_added")),
      )
    ),
    
    
    
    # TAB 2
    tabItem(
      tabName = "Popular",
      fluidRow(
        fluidPage(
          valueBox(tags$p(length(unique(data_disney$title)), style = "font-size: 100%; color: #D4ADFC;"), 
                   tags$p("Total Unique Film", style = "font-size: 150%; color: white;"),
                   color = "navy",
                   width = 4),
          valueBox(tags$p(length(unique(data_disney$rating)), style = "font-size: 100%; color: #D4ADFC;"), 
                   tags$p("Total Unique Rating", style = "font-size: 150%; color: white;"),
                   color = "red",
                   width = 4),
          valueBox(tags$p(length(unique(data_disney$category)), style = "font-size: 100%; color: #D4ADFC;"), 
                   tags$p("Total Unique Categories", style = "font-size: 150%; color: white;"),
                   color = "yellow",
                   width = 4),
        )
      ),
      
      
      fluidPage(
        box(width = 12,
            status = "primary", 
            solidHeader = TRUE,
            plotlyOutput(outputId = "plot_duration")),
        box(width = 12,
            solidHeader = TRUE,
            status = "warning",
            title = "Choose Year" ,
            selectInput(inputId = "input_year2",
                        label = NULL,
                        choices = levels(data_disney$year_added))),
        box(width = 12,
            status = "primary", 
            solidHeader = TRUE,
            plotlyOutput(outputId = "plot_topc")),
        box(width = 12,
            status = "primary", 
            solidHeader = TRUE,
            plotlyOutput(outputId = "plot_topr")),
      )
    ),
    
    # TAB 3
    
    
    # TAB 4
    tabItem(
      tabName = "Data",
      h2(tags$b("Dataset Disney"),align = "center",
         style = 'font-family: "Georgia"; font-style: italic;'),
      DT::dataTableOutput("data_disney")
    )
  )
)

#Assembly

ui <- 
  dashboardPage(
    header = header,
    body = body,
    sidebar = sidebar
  )
