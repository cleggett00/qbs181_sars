# qbs181_sars
QBS 181 group project focused on 2003 SARS outbreak

=============================== Table of Contents ===============================
1. functions              | defining functions to investigate distributions and missingness
2. clean_raw_data         | cleaning of SARS df, adjusting names, etc.
3. examing_missing_data   | investigate distributions of missingness in df
4. scrape_pop             | scrape 2003 world countries population for analysis later
5. max_case_max_incidence | calculate max case number and daily incidence to compare to SIR model predictions
6. SIR_plots              | plot the SIR curves and calculate predicted number of people effected in Singapore, Hong Kong, and Canada
7. map_rshiny             | create rshiny app of bubble plot of relative cases overlaid on selected countries over time (sliding bar)
8. plot_data_rshiny       | create rshiny app showing dot plot of selected variable in selected country within selected time frame (sliding bar) 
