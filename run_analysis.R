## This script will perform the following steps on the UCI HAR Dataset from 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
## 1. Merge the training and the test sets to create one data set.
## 2. Extract only the measurements on the mean and standard deviation for each measurement. 
## 3. Use descriptive activity names to name the activities in the data set
## 4. Appropriately label the data set with descriptive activity names. 
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## A little housekeeping, cleaning up environment
## getting the data and unzip it

rm(list=ls())
library(plyr)

temp <- tempfile()
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL, temp)
unzip(temp, exdir = getwd())
unlink(temp)

## 1. Merges the training and the test sets to create one data set.
## Set working directory to the location where the UCI HAR Dataset was unzipped

setwd("~/datasciencecoursera/gettingdata/week3/UCI HAR Dataset")

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")
X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")
x_data <- rbind(x_train, X_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)


## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt", header=FALSE)
col_mean_std <- grep("-(mean|std)\\(\\)", features[, 2])
x_data <- x_data[, col_mean_std]
names(x_data) <- features[col_mean_std, 2]

## 3. Uses descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt", header=FALSE)
y_data[, 1] <- activities[y_data[, 1], 2]
names(y_data) <- "activity"

## 4. Appropriately labels the data set with descriptive variable names.
names(subject_data) <- "subject"
final_data <- cbind(x_data, y_data, subject_data)

## 5. From the data set in step 4, 
## creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidyData <- ddply(final_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(tidyData, "tidyData.txt", row.names = TRUE)