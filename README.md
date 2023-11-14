# QBS 181 group project focused on 2003 SARS outbreak

Class: 			Dartmouth QBS 181
Date:			Fall 2023
Authors:		     Aislinn Gilmour, Monica Dimambro, Chris Leggett
Instructor:		Carly Bobak


## Description:
In this study, we wanted to visualize the 2003 SARS outbreak using RShiny apps, and conduct SIR analyses to compare to the real-world data. This required substantial cleaning and data exploration. Ultimately, this project gave us insights into just how far reporting, computing, and global communication has come in the space of emerging pandemics between 2003 and COVID-19 in 2019. 

To do these analyses, we used a longitudinal data set for the SARS pandemic (37 countries, 03/17/03 to 7/07/03) downloaded from Kaggle but sourced from World Health Organization SARS report to visualize the spread of the epidemic over time and geography using R-Shiny apps. We then compared the actual case counts to those predicted from an SIR analysis (commonly used in the study of infectious disease) for the countries for which we had an R-naught. Our process included investigating the distributions of variables, missingness, and patterns of missingness for each country in the data set prior to visualizations or modeling. To conduct our SIR analysis, we also had to scrape a table of 2003 world countries population. To generate our mapping rshiny app, we had to source longitude and latitude data for each country to be included in the app.

## Datasets:
1. Longitudinal data for the SARS pandemic (37 countries, 03/17/03 to 7/07/03) downloaded from Kaggle but sourced from World Health Organization SARS report
including the date, country, cumulative number of cases, cumulative number of deaths, and the number of recovered people for the SARS epidemic
2. Total population count in January 2003 for every country in world sourced from the CIA World Factbook, which we scraped from Theodora.com
3. Latitude and Longitude Data by Country sourced from Kaggle

## Programs and run order
1. functions: defines functions to plot data, write out country-specific datasets, and facilitate SIR modeling.
2. clean_raw_data: clean of SARS df, adjusting names, etc.
3. examing_missing_data: investigate and visulize missingness in df
4. scrape_pop: scrape 2003 world countries population for later analysis
5. max_case_max_incidence: calculate max case number and daily incidence to compare to SIR model predictions
6. SIR_plots: plot the SIR curves and calculate predicted number of people effected in Singapore, Hong Kong, and Canada
7. map_rshiny: create rshiny app that has bubble plot of relative cases overlaid on selected countries over time (sliding bar)
8. plot_data_rshiny: create rshiny app showing dot plot of selected variable in selected country within selected time frame (sliding bar)

## Prerequisites:
To use this R code, follow these steps:
1.	Clone the repository to your local machine:
git clone https://github.com/your-username/your-repository.git
2.	Open the R project in your preferred R development environment.
3.	Install the required packages using the following commands in the R console:
install.packages(c("dplyr", "deSolve", "rootSolve", "ggplot2", "tidyverse", "rprojroot", "naniar", "viridis", "gridExtra", "rvest"))
4.	Ensure that you have an active internet connection to download the packages from CRAN.

## Usage:
To use our R code, feed in the data we’ve provided or your own epidemic data including case counts, death counts, and time points across location. You will need to adjust the cleaning script for your unique data set. For the SIR plots, you will need to provide an R0 and beta to feed into the function. You should be able to use the Rshiny scripts and SIR plots with your own data so long as the data types and variable names are the same as ours or are adjusted prior to running.

The SIR function was provided by Dr. Annie Hoen from The Guarini School at Dartmouth College and developed by Dr Aidan Findlater. More information found here: http://rstudio-pubs-static.s3.amazonaws.com/6852_c59c5a2e8ea3456abbeb017185de603e.html

## Dependencies
Make sure to have the following R packages installed. You can install them using the instructions provided in the Installation section.
dplyr
deSolve
rootSolve
ggplot2
tidyverse
rprojroot
naniar
viridis
gridExtra
rvest

## Authors
This project was completed by Chris Leggett, Aislinn Gilmour, and Monica Dimambro from the Quantitative Biomedical Sciences Department at the Guarini School at Dartmouth College.

## Note about citations
Citations will be within the code where necessary. ChatGPT was used to help develop this comprehensive README file.
