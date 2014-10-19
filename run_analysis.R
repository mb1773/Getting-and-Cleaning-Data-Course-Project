## This R script is for the course project for the Getting and Cleaning Data course
## on Coursera

## Source data for this project from
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## This R script does the following
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names
## 5.  creates a second, independent tidy data set with the average of each 
##     variable for each activity and each subject

## set working directory
setwd("C:/coursera/UCI HAR Dataset")

## Step 1 - Merge the Training and Test Sets into variables X, Sub and Y
train <- read.table("train/X_train.txt")
test <- read.table("test/X_test.txt")
X <- rbind(train, test)

train2 <- read.table("train/subject_train.txt")
test2 <- read.table("test/subject_test.txt")
Sub <- rbind(train2, test2)

train3 <- read.table("train/y_train.txt")
test3 <- read.table("test/y_test.txt")
Y <- rbind(train3, test3)

## Step 2: Extract Measurements on Mean and STD

features <- read.table("features.txt")

## select only rows withy mean and STD from features
featurerows <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])

## subset x to only mean and std based on featurerows
X <- X[, featurerows]
## Set column heads of X to match features
names(X) <- features[featurerows, 2]
names(X) <- gsub("\\(|\\)", "", names(X))

## set to lower case for clean variable names

names(X) <- tolower(names(X))

## Step 3: Name Activities in dataset descriptively

activities <- read.table("activity_labels.txt")

## replace _ and change to lower case
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]

## name column in Y descriptively
names(Y) <- "activity"

## Step4 and 5: Add descriptive label names and creates new data set

names(Sub) <- "subject"
cleantraintest <- cbind(Sub, Y, X)
write.table(cleantraintest, "tidy_data.txt")
uniqsubjects = unique(Sub)[,1]
numbersubjects = length(unique(Sub)[,1])
numberactivities = length(activities[,1])
numbercols = dim(cleantraintest)[2]
final = cleantraintest[1:(numbersubjects*numberactivities), ]

count = 1 
for (c2 in 1:numbersubjects) { 
    for (c3 in 1:numberactivities) { 
        final[count, 1] = uniqsubjects[c2] 
        final[count, 2] = activities[c3, 2] 
        tmp <- cleantraintest[cleantraintest$subject==c2 & cleantraintest$activity==activities[c3, 2], ] 
        final[count, 3:numbercols] <- colMeans(tmp[, 3:numbercols]) 
        count = count+1 
    } 
    } 

write.table(final, "data_with_averages.txt", row.name=FALSE)

