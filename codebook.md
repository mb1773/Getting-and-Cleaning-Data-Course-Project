Course Project Code Book – Getting And Cleaning Data by Monica Mitchell

Github Repo: https://github.com/mb1773/Getting-and-Cleaning-Data-Course-Project.git

R Script Name: run_analysis.R

Source of original data set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Explanation of data from original source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Instructions
1.	 Download the data from the original data set location above, unzip to your hard drive in a directory c:/coursera/UCI HAR Dataset
2.	Load these libraries into R: httr, plyr, rcurl, tidyr
3.	Put the r script, run_analysis.R into the directory c:/coursera/UCI HAR Dataset and run it.  This script does the following:
Reads these datasets
•	X_train.txt		7352 observations of 561 variables v1, v2, v3….
•	X_test.txt		2947 observations of 561 variables v1, v2, v3…		
•	subject_train.txt	7352 observations of 1 variable v1
•	subject_test.txt		2947 observations of 1 variable v1
•	y_train.txt		7352 observations of 1 variable v1
•	y_test.txt		2947 observations of 1 variable v1
•	features.txt		561 observations of 2 variables v1, v2 where v2 includes mean and STD
•	activity_labels.txt	6 observations of 2 variables v1, v2

Since the data are in rows, 
Step 1 of the script uses the read.table command to read these text files:

•	reads data from X_train.txt and X_test.txt into a variable X using rbind;
•	then reads data from subject_train.txt and subject_test.txt into a variable Sub using rbind;
•	then reads data from y_train.txt and y_test.txt into a variable Y using rbind;

Use of rbind in these steps merges the data as follows
•	x			10299 observations of 561 variables
•	sub			10299 observations of 1 variable
•	y			10299 observations of 1 variable

Step 2, then Extracts the list of rows in the features data set that contain Mean or STD measurements using the grep command.  This cuts the data down to just what is needed since the instructions say we just need mean and STD – which makes it more manageable.  
The script then then subsets the X dataset based on that list of rows with mean and STD and sets the names to lower case using gsub command (which is listed in lecture notes as a good practice.)  This results in the data set X being cut down to 10299 observations of 66 variables

Sample of X column headings after subset
 	tbodyacc-mean-x	tbodyacc-mean-y	tbodyacc-mean-z	tbodyacc-std-x	tbodyacc-std-y

In Step 3, the script reads activity labels from activity_labels.txt And then applies, lower case to those activity labels and replaces these lower case activity labels in the the names of the merged Y data set to give Y descriptive activity names called for in the assignment using the gsub command.

 	V1	V2
1	1	walking
2	2	walkingupstairs
3	3	walkingdownstairs
4	4	sitting
5	5	standing
6	6	laying

Steps 4 and 5 Create a new data set and add the descriptive label names and then write the TXT file tidy_data_.txt using the write.table command.
The script then  removes _and other () using the gsub command since the lecture notes indicate that names of variables should be lowercase, descriptive, not duplicative, free from _ underescore, free from dot, and free from white space. 

The script then merges all the data into a final data set that is saved as tidy_data_with_averages.txt.

Sample of first few column headings of final file tidy_data_with_averages.txt
 	subject	activity	tbodyacc.mean.x	tbodyacc.mean.y	tbodyacc.mean.z	tbodyacc.std.x
 	
4. 	The text file is not pretty to the human eye.  To see pretty data set a variable equal to the text file
 	data <- read.table("tidy_data_with_averages.txt")



