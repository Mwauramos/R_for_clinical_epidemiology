# R for Clinical Epidemiology

## Overview
This repository focuses on the application of **statistical methods** to **epidemiological data** using R. The project involves the analysis of datasets related to **Ebola** and **Scabies** and applies both basic and advanced statistical techniques to derive meaningful insights for clinical epidemiology. 

Key statistical methods include **descriptive statistics**, **logistic regression**, **Poisson and Cox regression**, and advanced plotting using **ggplot2**. The repository is structured to support reproducible research in clinical epidemiology.

## Key Features
- **Comprehensive Data Analysis Workflow**: From data loading and manipulation to advanced statistical analyses.
- **Statistical Models**: Logistic regression, conditional logistic regression for matched case-control data, Poisson regression, and Cox regression.
- **Sample Size Calculations**: Tools for determining the required sample size for clinical studies.
- **Advanced Data Visualization**: Extensive use of ggplot2 for producing publication-quality visualizations.
- **Lexis Expansions**: Handling time as a confounder in survival data.
  
## Project Structure
This project is divided into various scripts that follow a step-by-step workflow:
1. **01_setup.R**: Setting up the environment for reproducible research.
2. **02_data_loading.R**: Loading datasets into R.
3. **03_data_manipulation.R**: Cleaning and preparing data for analysis.
4. **04_Descriptive_and_Basic_Statistics.R**: Performing descriptive statistics on clinical data.
5. **05_Basic_Plots.R**: Creating basic plots to visualize data distribution.
6. **06_Data_Visualization_with_ggplot2.R**: Advanced data visualization using ggplot2.
7. **07_Logistic_Regression_Analysis.R**: Logistic regression modeling for binary outcomes.
8. **08_Conditional_Logistic_Regression_for_Matched_Case-Control_Data.R**: Conditional logistic regression for matched case-control data.
9. **09_Poisson_and_Cox_Regression.R**: Survival analysis using Poisson and Cox regression models.
10. **10_Lexis_Expansions_and_Time_as_a_Confounder.R**: Time-to-event data analysis using Lexis expansions.
11. **11_Sample_Size_Calculations.R**: Calculating sample size for clinical studies.
12. **12_ggplot2_visualizations.R**: Additional ggplot2 visualizations for epidemiological data.

## Getting Started

### Prerequisites
You will need the following R packages to run the analysis:
- `tidyverse`
- `finalfit`
- `epiR`
- `survival`
- `ggplot2`

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/Mwauramos/R_for_clinical_epidemiology.git
   cd R_for_clinical_epidemiology
