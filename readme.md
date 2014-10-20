---
title: "Getting and Cleaning Data"
author: "Monica Mitchell"
date: "October 20, 2014"

---

This is a repository for code and documentation written for the Getting and Cleaning Data Course Project 

## Course Project

Documents include:

-  Readme.md
-	CodeBook.md
-	run_analysis.R script
- a txt file created with write.table() called - "data_with_averages.txt"

##Directions

* Unzip the source (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a folder on your local drive, say C:/Coursera/UCI Har Dataset/

* Put run_analysis.R into C:/Cousera/UCI HAR Dataset/

* In RStudio: setwd("C:/Cousera/UCI HAR Dataset/”), 
* In RSTudio: load the following libraries: httr, plyr, rcurl, tidyr
* IN RStudio: source("run_analysis.R")

* Use data <- read.table("tidy_data_with_averages.txt") to read the data. 
There are 30 subjects and 6 activities giving you 30 *6 =180 rows. 
