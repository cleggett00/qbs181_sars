# qbs181_sars
QBS 181 group project focused on 2003 SARS outbreak

=============================== Study Goal ===============================
In this study, we wanted to visualize the SARS outbreak in 2003 using RShiny apps and conduct SIR analyses to compare to the real-world data. This required substantial cleaning and data exploration. Ultimately, this project gave us insights into just how far reporting, computing, and global communication has come in the space of emerging pandemics between 2003 and COVID-19 in 2019. 

To do these analyses, we used a longitudinal data set for the SARS pandemic (37 countries, 03/17/03 to 7/07/03) downloaded from Kaggle but sourced from World Health Organization SARS report to visualize the spread of this epidemic over time and geography using R-Shiny apps. We then compared the actual case counts to those predicted from an SIR analysis (commonly used in the study of infectious disease) for the countries for which we had an R-naught. Our process included investigating the distriutions of variables, missingness, and patterns of missingness for each country in the data set prior to visualizations or modeling. To conduct our SIR analysis, we also had to scrape a table of 2003 world countries population. To generate our mapping rshiny app, we had to source longitude and latitude data for each country to be included in the app.

=============================== Data Description ===============================
1. Longitudinal data set for the SARS pandemic (37 countries, 03/17/03 to 7/07/03) downloaded from Kaggle but sourced from World Health Organization SARS report
including the date, country, cumulative number of cases, cumulative number of deaths, and the number of recovered people for the SARS epidemic
2. Total population count in January 2003 for every country in world sourced from the CIA World Factbook, which we scraped from Theodora.com
3. Latitude and Longitude Data by Country sourced from Kaggle

=============================== Table of Contents ===============================
1. functions              | defining functions to investigate distributions and missingness
2. clean_raw_data         | cleaning of SARS df, adjusting names, etc.
3. examing_missing_data   | investigate distributions of missingness in df
4. scrape_pop             | scrape 2003 world countries population for analysis later
5. max_case_max_incidence | calculate max case number and daily incidence to compare to SIR model predictions
6. SIR_plots              | plot the SIR curves and calculate predicted number of people effected in Singapore, Hong Kong, and Canada
7. map_rshiny             | create rshiny app of bubble plot of relative cases overlaid on selected countries over time (sliding bar)
8. plot_data_rshiny       | create rshiny app showing dot plot of selected variable in selected country within selected time frame (sliding bar) 
