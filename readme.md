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

* Use data <- read.table("tidy_data_with_averages.txt", header=TRUE) to read the data. 
There are 30 subjects and 6 activities giving you 30 *6 =180 rows. 

Explanation of what scripts do
Instructions 1. Download the data from the original data set location above, unzip to your hard drive in a directory c:/coursera/UCI HAR Dataset 2. Load these libraries into R: httr, plyr, rcurl, tidyr 3. Put the r script, run_analysis.R into the directory c:/coursera/UCI HAR Dataset and run it. This script does the following: Reads these datasets • X_train.txt 7352 observations of 561 variables v1, v2, v3…. • X_test.txt 2947 observations of 561 variables v1, v2, v3…
• subject_train.txt 7352 observations of 1 variable v1 • subject_test.txt 2947 observations of 1 variable v1 • y_train.txt 7352 observations of 1 variable v1 • y_test.txt 2947 observations of 1 variable v1 • features.txt 561 observations of 2 variables v1, v2 where v2 includes mean and STD • activity_labels.txt 6 observations of 2 variables v1, v2

Since the data are in rows, Step 1 of the script uses the read.table command to read these text files and combine using rbind:

• reads data from X_train.txt and X_test.txt into a variable X using rbind; 
• then reads data from subject_train.txt and subject_test.txt into a variable Sub using rbind; 
• then reads data from y_train.txt and y_test.txt into a variable Y using rbind;

Use of rbind in these steps merges the data as follows 
• x 10299 observations of 561 variables 
• sub 10299 observations of 1 variable 
• y 10299 observations of 1 variable

Step 2, then Extracts the list of rows in the features data set that contain Mean or STD measurements using the grep command. 
This cuts the data down to just what is needed since the instructions say we just need mean and STD – which makes it more manageable.
The script then then subsets the X dataset based on that list of rows with mean and STD and sets the names to lower case using gsub command (which is listed in lecture notes as a good practice.)
This results in the data set X being cut down to 10299 observations of 66 variables

Sample of X column headings after subset tbodyacc-mean-x tbodyacc-mean-y tbodyacc-mean-z tbodyacc-std-x
tbodyacc-std-y

In Step 3, the script reads activity labels from activity_labels.txt And then applies, lower case to those activity labels and replaces these lower case activity labels in the the names of the merged Y data set to give Y descriptive activity names called for in the assignment using the gsub command.  I used these as the descriptive labels since these were provided as the labels by the originators of the source data, since they are readable by the human eye and since they fit the instructors definition of good row names (no space, no dots, no underscores and no parens)

V1  V2

1 1 walking 2 2 walkingupstairs 3 3 walkingdownstairs 4 4 sitting 5 5 standing 6 6 laying

Steps 4 and 5 Create a new data set and add the descriptive label names and then write the TXT file tidy_data_.txt using the write.table command. The script then removes _and other () using the gsub command since the lecture notes indicate that names of variables should be lowercase, descriptive, not duplicative, free from _ underescore, free from dot, and free from white space.

The script then merges all the data into a final data set that is saved as tidy_data_with_averages.txt.

Sample of first few column headings of final file tidy_data_with_averages.txt subject activity
tbodyacc-mean-x tbodyacc-mean-y tbodyacc-mean-z tbodyacc-std-x
I did not replace these headers for 2 reasons - 1) they do not violate the instructors rules for headers since they do not contain space, dots, underscores, or parethesis and 2) the source data did not give translations beyond the text provided.  While it might be possible to translate this text from google searches this seemed beyond the scope of this class.

    The text file is not pretty to the human eye. To see pretty data set a variable equal to the text file in R using a statement like:
    data <- read.table("tidy_data_with_averages.txt", header=TRUE)
