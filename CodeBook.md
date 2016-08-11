---
title: "Getting and Cleaning Data Course Project"
author: "Rony Labonte"
date: "August 11, 2016"
output: html_document
---

# Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

# Variables definition
# Read the data from files

x_train: reads x_train.txt

y_train: reads y_train.txt
subject_train: subject_train.txt

X_test: reads X_test.txt
y_test: reads y_test.txt
subject_test: reads subject_test.txt
x_data: combines rows (x_train, X_test)
y_data: combines rows (y_train, y_test)
subject_data:  combines rows(subject_train, subject_test)

features:  reads features.txt
col_mean_std : (grep) Extract only the measurements on the mean and standard deviation for each measurement 
x_data: subset of the columns needed

activities:  reads activity_labels.txt

final_data: combines the final test data set

tidyData: data set with the average of each variable for each activity and each subject.