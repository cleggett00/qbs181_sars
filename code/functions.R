
# title:  Functions Library
# authors: Chris Leggett, Aislinn Gilmour, Monica Dimambro
# date:   2023-11-14

# Description: plot one variable at a time from one country at a time
# Parameters: data frame of country data, country (row), variable called yvar (columns)
# What the function returns: a dot plot of specified variable for specified country from df passed into function
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

# Description: split data for one country from main data frame for future country-specific analysis
# Parameters: data frame of country data, where countries are represented in the rows
# What the function returns: one RDAT file per country in the data set, containing a subset of the data for each country
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

# Description: define a function to pass into an ordinary differential equations function (ode()) as func=sir
# example use: out_canada <- ode(y = init, times = times, func = sir, parms = parameters_canada)
# Parameters: 
# (1) intial proportion in each compartment (S, I, and R) 
# (2) beta (the infection parameter) and gamma (the recovery parameter) which are related to R-naught in the beta/gamma = R-naught
# (3) time from start of outbreak to final timepoint, in days and presented as string of integers by 1.
# example parameters: 
# set initial proportion in each compartment, typically Susceptible = 0.999999, Infected = 0.000001, Recovered = 0 as follows: 
# init <- c(S = 1-1e-6, I = 1e-6, R = 0.0)
# set parameters (beta = infection parameter, gamma = recovery parameter) as follows: parameters_canada <- c(beta = beta, gamma = gamma_canada)
# set time frame (2 years = 730 days) with the following: times <- seq(0, 730, by = 1)
# What the function returns: a list of the proportion of the population who is susceptible, infected, and recovered, to be used within the ode function
sir <- function(time, state, parameters) {
     
     with(as.list(c(state, parameters)), {
          
          dS <- -beta * S * I
          dI <-  beta * S * I - gamma * I
          dR <-                 gamma * I
          
          return(list(c(dS, dI, dR)))
     })
}
