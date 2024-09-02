# Setting up the R environment and installing necessary packages

# Introduction: This script installs and loads all the packages required for 
# the comprehensive statistical analysis project on Ebola and Scabies data.

# Package Installation: Uncomment the following lines to install packages if they are not already installed.
# install.packages("tidyverse")  # Data manipulation and visualization
# install.packages("splitstackshape")  # Expanding datasets
# install.packages("epiR")  # Tools for epidemiology, especially 2*2 tables and stratified MH Odds
# install.packages("lmtest")  # Likelihood ratio tests between models
# install.packages("Epi")  # Tools for Lexis Models (used in epidemiology)
# install.packages("popEpi")  # Extra tools to complement 'Epi'
# install.packages("survival")  # Survival analysis, Kaplan-Meier plots, Cox regression
# install.packages("survminer")  # Enhanced Kaplan-Meier plots
# install.packages("lme4")  # Fitting random-effects models
# install.packages("sjstats")  # Intraclass correlation coefficients (ICCs) from random-effects models
# install.packages("mice")  # Multiple imputation
# install.packages("arsenal")  # Summary tables
# install.packages("survey")  # Handling complex survey data
# install.packages("ICC")  # Alternative methods for ICC calculation from survey data
# install.packages("meta")  # Meta-analysis
# install.packages("metafor")  # Meta-analysis
# install.packages("broom")  # Tidying up model outputs
# install.packages("broom.mixed")  # Tidying mixed models

# Loading Packages: Make sure to load the required packages before starting your analysis
library(tidyverse)
library(splitstackshape)
library(epiR)
library(lmtest)
library(Epi)
library(popEpi)
library(survival)
library(survminer)
library(lme4)
library(sjstats)
library(mice)
library(arsenal)
library(survey)
library(ICC)
library(meta)
library(metafor)
library(broom)
library(broom.mixed)

# This setup script ensures that all necessary tools are available for the analysis.
# After running this script, proceed to the data manipulation phase.
