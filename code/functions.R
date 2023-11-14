
# title:  Functions Library
# author: Chris Leggett and Aislinn Gilmour
# date:   2023-11-08


# plot data from one country at a time
plot_one <- function(df=cleandata2, country, yvar) {
     df <- df %>%
          filter(Country %in%(country))
     ggplot(df, aes(x = Date, y = get(yvar))) +
          geom_point(color = "steelblue3") +
          labs(x= NULL, y= NULL) +
          ggtitle(country) +
          expand_limits(y=0) +
          theme_classic()
}


# save one country at a time for country-specific analysis
split_and_save_by_country <- function(data) {
  unique_countries <- unique(data$Country)
  
  for (country in unique_countries) {
    country_data <- data[data$Country == country, ]
    
    # Define the RDS file name for each country
    rds_file <- paste0(country, ".rds")
    
    # Save the country-specific data to an RDS file
    saveRDS(country_data, file = rds_file)
  }
}
