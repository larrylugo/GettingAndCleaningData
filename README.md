Getting and Cleaning Data: Course Project
======================

Part of Data Science Specialist Course, offered by Johns Hopkins University.

(i) Introduction

This repository contains the work for the Coursera course "Getting and Cleaning data", part of the Data Science specialization offered online by Johns Hopkins University. 

(ii) The raw data

The raw data was obtained from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Check the README.txt file for further details about this dataset.

The 561 features are unlabeled and can be found in the corresponding files, as described in data set documentation. 


(iii) The script "run_analysis.R" and the "tidy.txt" dataset

Following course's directions, an R script called run_analysis.R was written in order to do the following:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

(iv) The Code Book
The CodeBook.md describes the variables, the data, and transformations performed to clean up, run the R script and get the tidy.txt data set.
