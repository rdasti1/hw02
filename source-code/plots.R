# Dasti, Rayyaan

# Clean up the working environment
rm(list = ls())

#Loading the package tidyverse
library(tidyverse)

#Reading countries.csv into countriesData dataframe, and treating character
#variables as factors
countriesData <- read.csv("datasets/countries.csv", stringsAsFactors = TRUE)

#summarizing the variables in countriesData
summary(countriesData)
#part b - 58 countreis are missing data for ecological_footprint_2000
#part c - 44 countries in this dataset are from Asia
#part d - measles_immunization_oneyearolds is numerical, continuous
# fines_for_tobacco_advertising_2014 is numerical, discrete

#line of code that uses ggplot() to generate boxplot
ggplot(countriesData, aes(x=measles_immunization_oneyearolds, y=continent)) +
  geom_boxplot()
#europe has the most symmetrical result
#it is the whisker length and median location

#line of code that uses ggplot() to generate histogram
ggplot(countriesData, aes(x=ecological_footprint_2000)) +
  geom_histogram()
#the distribution is right skewed
#the first quartile being 1.1 and the 3rd being 4.9 while the median is
#2.1 and mean is 3.1 supports the observation that it is right skewed.
