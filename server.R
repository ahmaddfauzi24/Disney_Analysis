server <- function(input, output) {
  
  
  # Subsetting for CheckGroupInput
  FilmSubset <-reactive({
    if (is.null(input$Film) == TRUE) {
      return(data_disney)
    } else {
      return(filter(data_disney, type %in% input$Film))
    }
  })
 
  
  # Plot Released
  output$plot_film <- renderEcharts4r({
    
    film_released2 <- 
      FilmSubset () %>% 
      mutate(release_year = year(release_year)) %>% 
      select(release_year, type) %>% 
      group_by(release_year) %>% 
      mutate(total_film = length(release_year))
    
    plot_film <- film_released2 %>% ggplot(mapping = aes(x=release_year, fill=type, text = glue("{type}
                                                                                            Total Film: {total_film}
                                                                                            Year: {release_year}"))) +
      geom_histogram() +
      labs(title = "Disney Films Released by Year", x="Release Year", y="Total Film") +
      scale_fill_manual(values = c("Movie" = "Black", "TV Show" = "Red")) +
      theme_algoritma +
      theme(plot.title = element_text(face = "bold", hjust = 1))
    
    
    ggplotly(plot_film, tooltip = "text")
  })
  
  # Plot Added
  output$plot_added <- renderEcharts4r({
    
    plot_added <- 
      FilmSubset() %>% 
      filter(year_added == input$input_year) %>% 
      group_by(month_added,type)%>% 
      count(name = "Freq") %>% 
      ggplot(aes(x=month_added,y=Freq,fill=type))+
      geom_col(aes(fill=type,  text = glue("{type}
                                       Total Film: {Freq}")))+
      labs(title=glue("Disney Films Added by Month in {input$input_year}"), x="Month", y="Total Film")+
      scale_fill_manual(values = c("Movie" = "Black", "TV Show" = "Red")) +
      theme_algoritma+
      theme(plot.title=element_text(face="bold",hjust=1  )) 
      
    ggplotly(plot_added, tooltip = "text")
  })
  
  # Plot Duration
  output$plot_duration <- renderEcharts4r({
    
    plot_duration <- data_disney %>% 
      filter(type=='Movie' & release_year>="2000-01-01" & release_year<="2022-01-01") %>% 
      mutate(movie_duration=substr(duration,1,nchar(as.character(duration))-4)) %>% 
      mutate(movie_duration = as.integer(movie_duration)) %>% 
      group_by(release_year) %>% 
      summarise(avg_duration = mean(movie_duration)) %>% 
      ggplot(aes(x=release_year, y= avg_duration))+
      geom_point(aes(fill=release_year, text = glue("Release Year: {year(release_year)}
                                                Duration: {round(avg_duration, 2)} Minutes"))) + geom_smooth()+
      labs(title = "Disney Movie Duration From 2000 - 2021", x = "Year", y = "Duration")+
      theme_algoritma+
      theme(plot.title=element_text(face="bold",hjust=1)) +
      theme(legend.position = "none")
    
    ggplotly(plot_duration, tooltip = "text")
  })
  
  # Plot topc
  output$plot_topc <- renderEcharts4r({
    
    top_categories <- data_disney %>% 
      filter(year_added == input$input_year2) %>% 
      group_by(category) %>% 
      count(name = "Freq") %>% 
      arrange(desc(Freq)) 
    top10_categories <- head(top_categories,10)
    
    
    plot_topc <- ggplot(top10_categories,mapping=aes(x=Freq, reorder(category,Freq),  text = glue("Category: {category}
                                                                                              Total Film: {Freq}")))+
      geom_col(aes(fill=Freq),show.legend = F)+
      scale_fill_gradient(low="#E60E04",high="#000000")+
      labs(title = glue("Disney Top 10 Categories in {input$input_year2}"), x = "Total Film", y = NULL)+
      theme_algoritma+
      theme(plot.title=element_text(face="bold", hjust = 1))+
      geom_vline(xintercept = mean(top10_categories$Freq), col="yellow",linetype=2,lwd=1)
    
    ggplotly(plot_topc, tooltip = "text")
  })
  
  # Plot topr
  output$plot_topr <- renderEcharts4r({
    
    top_ratings <- data_disney %>% 
      filter(year_added == input$input_year2) %>% 
      group_by(rating) %>% count(name = "Freq") %>% arrange(desc(Freq))
    top10_ratings <- head(top_ratings,10)
    
    plot_topr <- ggplot(data = top10_ratings, mapping=aes(x=Freq,y=reorder(rating,Freq), text = glue("Rating: {rating}
                                                                                              Total Film: {Freq}")))+
      geom_col(aes(fill=Freq), show.legend = F)+
      scale_fill_gradient(low="#E60E04",high="#000000")+
      labs(title = glue("Disney Top 10 Ratings in {input$input_year2}"), x = "Total Film", y= NULL)+
      theme_algoritma+
      theme(plot.title = element_text(face="bold",hjust=1))+
      geom_label(data = top10_ratings[1:4,], mapping=aes(label=Freq))+
      geom_vline(xintercept = mean(top10_ratings$Freq), col = "yellow",linetype=2,lwd=1)
    
    ggplotly(plot_topr, tooltip = "text")
  })
  
  
  # Dataset
  
  output$data_disney <- DT::renderDataTable(data_disney, options = list(scrollX = T))
}
  
  
  
  
  