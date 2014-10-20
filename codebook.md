Course Project Code Book – Getting And Cleaning Data
Github Repo: https://github.com/mb1773/Getting-and-Cleaning-Data-Course-Project.git

R Script Name: run_analysis.R
Source of original data set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Explanation of data from original source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The R script, run_analysis.R, reads data from the text files:
X_train.txt		7352 observations of 561 variables v1, v2, v3….
X_test.txt		2947 observations of 561 variables v1, v2, v3…		
subject_train.txt	7352 observations of 1 variable v1
subject_test.txt		2947 observations of 1 variable v1
y_train.txt		7352 observations of 1 variable v1
y_test.txt		2947 observations of 1 variable v1
features.txt		561 observations of 2 variables v1, v2 where v2 includes mean and STD
activity_labels.txt	6 observations of 2 variables v1, v2

Sample data from Features.txt
 	V1	V2
1	1	tBodyAcc-mean()-X
2	2	tBodyAcc-mean()-Y
3	3	tBodyAcc-mean()-Z
4	4	tBodyAcc-std()-X
5	5	tBodyAcc-std()-Y
6	6	tBodyAcc-std()-Z



and merges the data into
	x			10299 observations of 561 variables
	sub			10299 observations of 1 variable
	y			10299 observations of 1 variable

Then Extracts the Mean and STD for rows of Features and subsets the X dataset based on that extract.
X is then10299 observations of 66 variables

Sample of X column headings after subset
 	tbodyacc-mean-x	tbodyacc-mean-y	tbodyacc-mean-z	tbodyacc-std-x	tbodyacc-std-y

The script reads activity labels from activity_labels.txt
 	V1	V2
1	1	walking
2	2	walkingupstairs
3	3	walkingdownstairs
4	4	sitting
5	5	standing
6	6	laying
And then applies these names to the merged data set.

The script removes _ and other () from data and names.  Then merges all the data into a final data set that is saved as data_with_averages.txt.

Sample of first few column headings of final file
 	subject	activity	tbodyacc.mean.x	tbodyacc.mean.y	tbodyacc.mean.z	tbodyacc.std.x

