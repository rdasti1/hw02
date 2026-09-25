####### INST314 Flipped -- 02 Introduction to graphics ######

### Cleaning workspace and loading packages ####
# Before anything else, verify that your environment is totally clear.
# This is important, because old objects can foul up the works
# Clean up the working environment
rm(list = ls())

# Load the package(s).  You will need to include which packages should be loaded at
# the beginning of every script.  In this case we will use ggplot2, which is
# part of the tidyverse
library(tidyverse)

# The goal here is for you to see some basic graphical formats and get a sense
# of when they are useful

# You will also eventually make graphs of your own, such as histograms, bar
# charts, box plots, and scatter plots.

### ggplot2 ####

# The function ggplot() allows us to graph most kinds of data relatively simply.
# Its syntax is slightly odd but very flexible. We’ll show specific commands for
# several types of plots below.
#
# To make a graph with ggplot(), you need to specify at least two elements in your
# command. The first uses the function ggplot() itself, to specify which data
# frame you want to use and also which variables are to be plotted. The second
# part tells R what kind of graph to make, using a geom function. The odd part is
# that these two parts are put together with a + sign. It’s simplest to see this
# with an example. We’ll draw a histogram with ggplot() in the next section.

# Hot tip.  If you want to annotate just by typing and then organize and comment
# out (i.e., put # in front of) multiple lines at once, you can use
# Ctrl+Shift+C in Windows or Command+Shift+C on a mac

### OK, kids, let's make a histogram ####

# Start by reading in the titanic dataset
# Strings as factors tells R that where there are letters, the entries represent
# different levels of a categorical variable

titanicData <- read.csv("datasets/titanic.csv", stringsAsFactors = TRUE)

# It is useful to see what these data look like.  We will use summary()
summary(titanicData)

# For numerical variables summary() returns some descriptive statistics like
# min, max, median, and the quartiles, as well as the number of NAs

# Dealing with NAs is a topic for another day

# For categorical variables, you will see how many observations there are for
# each level (e.g., for the categorical variable passenger_class, 322 rows had
# the level 1st)

# Histograms
# A histogram represents the frequency distribution of a numerical variable in a
# sample.
#
# Let’s see how to make a basic histogram using the age data from the Titanic
# data set. Make sure you have loaded the data (using read.csv) into a data frame
# called titanicData.

# Here is the code to make a simple histogram of age.

ggplot(titanicData, aes(x=age)) +
  geom_histogram()

# What is that warning message?!?
# Welp, I wrote we would save NA for another day, but I lied.  The short
# version is that for age, there were 680 entries missing data.

# Notice that there are two functions called here, put together in a single
# command with a plus sign. The first function is ggplot(), and it has two input
# arguments. Listed first is titanicData; this is the name of the data frame
# containing the variables that we want to graph. The second input to ggplot is
# an aes() function. In this case, the aes() function tells R that we want age
# to be the x-variable (i.e. the variable that is displayed along the x-axis).
# (The aes stands for “aesthetics”,” but if you’re like us this won’t help you
#   remember it any better.)

# The second function in this command is geom_histogram(). This is the part that
# tells R that the “geometry” of our plot should be a histogram.

# This is not the most beautiful graph in the world, but it conveys the
# information. At the end of this lab we’ll see a couple of options that can
# make a ggplot graph look a little better.  Trust me that making the most
# beautiful figure is both satisfying and an endless rabbit hole of internet
# searches.  You don't have that kind of time right now.

### Bar graphs ####

# Scientists call many different looking things a "bar graph."  In the language
# of ggplot, a bar graph has the height of the bar proportional to
# the number of cases in each group.  So the ggplot "bar graph" plots the
# frequency distribution of a categorical variable.

# In ggplot(), the syntax for a bar graph is very similar to that for a
# histogram. For example, here is a bar graph for the categorical variable sex in
# the titanic data set. Aside from specifying a different variable for x, we use
# a different geom function here, geom_bar.

ggplot(titanicData, aes(x=sex)) +
  geom_bar(stat="count")

# Again, not the prettiest graph you ever say, but it tells you that there were
# more male passengers than female passengers on the Titanic.

### Box plots ####
# A boxplot is a convenient way of showing the frequency distribution of a
# numerical variable in multiple groups. Here’s the code to draw a boxplot for
# age in the titanic data set, separately for each sex:

ggplot(titanicData, aes(x=sex, y=age)) +
  geom_boxplot()

# Notice that the y variable here is age, and x is the categorical variable sex
# that winds up on the x-axis. See the result below, and look at where the
# variables are. The other new feature here is the new geom function,
# geom_boxplot().
#
# Here the thick bar in the middle of each boxplot is the median of that group.
# The upper and lower bounds of the box extend from the first to the third
# quartile. (The “first quartile” is the 25th percentile of the data–the value
# which is bigger than 25% of the other values. The “third quartile”
# is the 75th percentile– the value bigger than 3/4 of the other values.)
#
# The vertical lines are called whiskers, and they cover most of the range of the
# data (except when data points are pretty far from the median (see text), when
# they are plotted as individual dots, as on the male boxplot).



### Scatterplots to visualize relationship between two numerical variables####

# The last graphical style that we will cover here is the scatter plot, which
# shows the relationship between two numerical variables.
#
# The titanic data set does not have two numerical variables, so let’s use a
# different data set.  This dataset is from an evolutionary biology study showing
# the relationship between the ornamentation of father guppies and the sexual
# attractiveness of their sons.  (Google Sexy Sons Hypothesis for more info,
# BUT do not fall into the trap of thinking what goes for guppies must also
# go for human beings!  Looking at you, Psychology Today article.)

#You can load the gupppy data for that example with

guppyFatherSonData <- read.csv("datasets/guppy.csv", stringsAsFactors = TRUE)

# To make a scatter plot of the variables fatherOrnamentation and
# sonAttractiveness with ggplot, you need to specify the x and y variables,
# and use geom_point():

ggplot(guppyFatherSonData, aes(x=fatherOrnamentation, y=sonAttractiveness)) +
  geom_point()

### Graphics options: It doesn't have to be so ugly ####
# The code we have listed here for graphics barely scratches the surface of what
# ggplot, and R as a whole, are capable of. Not only are there far more choices
# about the kinds of plots available, but there are many, many options for
# customizing the look and feel of each graph. You can choose the font, the font
# size, the colors, the style of the axes labels, etc., and you can customize the
# legends and axes legends nearly as much as you want.

# Let’s dig a little deeper into just a couple of options that you can add to
# any of the forgoing graphs to make them look a little better. For example, you
# can change the text of the x-axis label or the y-axis label by using xlab or
# ylab. Let’s do that for the scatterplot, to make the labels a little nicer to
# read for humans.
# The labels that we want to add are included in quotes inside the xlab and
# ylab functions.

ggplot(guppyFatherSonData, aes(x=fatherOrnamentation,y=sonAttractiveness)) +
  geom_point() +
  xlab("Father's ornamentation") + ylab("Sons attractiveness")

# It can also be nice to remove the default gray background, to make what some
# feel is a cleaner graph. Try adding theme_minimal() to the end of one of your
# lines of code making a graph.  Don't forget that + sign each time you tweak
# part of your graph!

ggplot(guppyFatherSonData, aes(x=fatherOrnamentation,y=sonAttractiveness)) +
  geom_point() +
  xlab("Father's ornamentation") + ylab("Sons attractiveness") +
  theme_minimal()

### Getting help ####
# The help pages in R are the main source of help, but the amount of detail
# might be off-putting for beginners. For example, to explore the options for
# ggplot(), enter the following into the R Console.

help(ggplot)

# This will cause the contents of the manual page for this function to
# appear in the Help window in RStudio. These manual pages are often
# frustratingly technical.  They are literally written in another language, and
# so what many of us do instead is simply google the name of the function—
# there are a great number of resources online about R.

### Describing the center of a sample ####

# We have already seen in lab 1 how to calculate the mean of a vector of data
# using mean(). Unfortunately, if there are missing data we need to tell R how
# to deal with it.

# A (somewhat annoying) quirk of R is that if we try to take the mean of a
# list of numbers that include missing data, we get an NA for the result!

# We are going to tell R, "hey, we are using the dataset we named titanicData,
# then we want to look specifically at the variable called age". We do that by
# writing titanicData$age

mean(titanicData$age)

# R returns NA as the mean, which is not useful at all.

#To get the mean of all the numbers that we do have, we have to add an option
# to the mean() function. This option is na.rm = TRUE. This tells R to remove
# (“rm”) the NAs before taking the mean. It turns out that the mean age of
# passengers that we have information for was about 31.2.

mean(titanicData$age, na.rm = TRUE)

# na.rm = TRUE can be added to many functions in R, including median(), as
# we shall see next.

# The median of a series of numbers is the “middle” number – half of the
# numbers in the list are greater the median and half are below it. It can be
# calculated in R by using median().

median(titanicData$age, na.rm = TRUE)

### Describing the spread of a sample ###

# R can also calculate measures of the variability of a sample. In this
# section we’ll learn how to calculate the variance, standard deviation,
# and interquartile range of a set of data.

# To calculate the variance of a list of numbers, use var().
var(titanicData$age, na.rm = TRUE)

# Note that var(), as well as sd() below, have the same need for na.rm = TRUE
# when analyzing data that include missing values.

# The standard deviation can be calculated by sd().
sd(titanicData$age, na.rm = TRUE)

# Of course, the standard deviation is the same as the square root of the
# variance.

sqrt(var(titanicData$age, na.rm = TRUE))

# The IQR an be calculated with IQR() and yes, the capitalization matters
IQR(titanicData$age, na.rm = TRUE)
