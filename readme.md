---
title: "Getting and Cleaning Data"
author: "Monica Mitchell"
date: ", October 20, 2014"

---

This is a repository for code and documentation written for the Getting and Cleaning Data Course Project "https://class.coursera.org/getdata-008/human_grading/view/courses/972586/assessments/3/submissions" offered through Johns Hopkins University.

## Course Project

Documents include:

-  Readme.md
-	CodeBook.md
-	run_analysis.R script
- a txt file created with write.table() called - "data_with_averages.txt"

##Directions

* Unzip the source (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a folder on your local drive, say C:/Coursera/Documents/R/

* Put run_analysis.R into working director with UCI HAR Dataset (c:/Cousera/UCI HAR Dataset/)

* In RStudio: setwd("C:/Cousera/UCI HAR Dataset/”), followed by: source("run_analysis.R")

* Use data <- read.table("data_set_with_the_averages.txt") to read the data. 
There are 30 subjects and 6 activities, thus there are 30 *6 =180 rows. 
