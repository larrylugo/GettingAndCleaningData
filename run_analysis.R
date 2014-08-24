## Script "run_analysis.R" 
## By: Larry Lugo
## Date: August, 2014.

# Preliminary steps: set the work directory, create working folders if necessary 
# and load required packages for analysis purposes

if(!file.exists("C:/Users/Larry/DataScience-Coursera/GettingAndCleaningData/Project")){dir.create("C:/Users/Larry/DataScience-Coursera/GettingAndCleaningData/Project")}
setwd("C:/Users/Larry/DataScience-Coursera/GettingAndCleaningData/Project")

library(reshape2)
# Library "mice" is necessary for imputting data, as a tidy data set must not have missing values
# Mice also test if there are missing values. If not, an error message appears.
library(mice) 

# Load test data. As source files are zipped, they were downloaded and unzipped to 
# working directory before the following step:

subject_test <- read.table("./UCI_HAR_Dataset/test/subject_test.txt")
X_test <- read.table("./UCI_HAR_Dataset/test/X_test.txt")
y_test <- read.table("./UCI_HAR_Dataset/test/y_test.txt")

# Imputing data on X_test to manage missing values
# As data "per se" is stored in X_test and X_train, imputing process were applied only
# on those files.
# The rest of files in "Inertial Signal" folder were ignored
# according to class notes on Forums

imputedX_test=complete(mice(X_test))

# An error message said there is no missing values:
# ">_Error en mice(X_test) : No missing values found"
# Now, we can load train data
subject_train <- read.table("./UCI_HAR_Dataset/train/subject_train.txt")
X_train <- read.table("./UCI_HAR_Dataset/train/X_train.txt")
y_train <- read.table("./UCI_HAR_Dataset/train/y_train.txt")

# Looking for missing values and imputing then if necessary
imputedX_train=complete(mice(X_train))

# Same result as X_test: no missing value. The following message appeared:
# ">_Error en mice(X_train) : No missing values found"

# Using labels to describe activity names
activity_labels <- read.table("./UCI_HAR_Dataset/activity_labels.txt")

# Load feature names and assign them to headers data frame
features <- read.table("./UCI_HAR_Dataset/features.txt")
headers <- features[,2]

# Assign names to columns of test and train features
names(X_test) <- headers
names(X_train) <- headers

# Select mean and std headers as requested
mean_and_std <- grepl("mean\\(\\)|std\\(\\)", headers)

# Get "mean" and "std" columns on test and train data frames
X_test_mean_and_std <- X_test[,mean_and_std]
X_train_mean_and_std <- X_train[,mean_and_std]

# Merge data from test and train subjects 
mergedSubjects <- rbind(subject_test, subject_train)
X_merged <- rbind(X_test_mean_and_std, X_train_mean_and_std)
y_merged <- rbind(y_test, y_train)

# Combine all vectors and data frames into one data.frame
mergedAll <- cbind(mergedSubjects, X_merged, y_merged)
names(mergedAll)[1] <- "SubjectID"
names(mergedAll)[2] <- "Activity"

# Aggregate by subject ID and activity
aggSubj <- aggregate(. ~ SubjectID + Activity, data=mergedAll, FUN = mean)

# Change original activity names for better ones
aggSubj$Activity <- factor(aggSubj$Activity, labels=activity_labels[,2])

# Finally, write a new tidy.txt file 

write.table(aggSubj, file="./tidy.txt", sep="\t", row.names=FALSE)

