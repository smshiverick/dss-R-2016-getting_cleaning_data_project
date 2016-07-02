## COURSERA GETTING AND CLEANING DATA COURSE PROJECT
## Sean M. Shiverick    6.30.16
## Create one R script called run_analysis.R that does the following:
## (First, Download Data and Unzip files: UCI_HAR_Dataset)
setwd("~/data_science_coursera/getting_cleaning_data/course_project")
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "Dataset.zip", method = "curl")
unzip(zipfile = "Dataset.zip")

## 1. Merge the training and the test sets to create one data set.
## (a) Read unzipped test and train files from UCI_HAR_Dataset
x_train <- read.table("UCI_HAR_Dataset/train/X_train.txt")
y_train <- read.table("UCI_HAR_Dataset/train/y_train.txt")
subject_train <- read.table("UCI_HAR_Dataset/train/subject_train.txt")

x_test <- read.table("UCI_HAR_Dataset/test/X_test.txt")
y_test <- read.table("UCI_HAR_Dataset/test/y_test.txt")
subject_test <- read.table("UCI_HAR_Dataset/test/subject_test.txt")

## (b) Create 'x' data set; create 'y' data set, and 'subject' data set, using 
## rbind() to combine the train and test data together in single file for each. 
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

## 2. Get columsn only with mean() and std() in names.
features <- read.table("UCI_HAR_Dataset/features.txt")
mean_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
x_data <- x_data[, mean_std_features]
names(x_data) <- features[mean_std_features, 2]

## 3. Uses descriptive name for activities in data set
## Read activity labels; update values with correct activity names, column name
activities <- read.table("UCI_HAR_Dataset/activity_labels.txt")
y_data[, 1] <- activities[y_data[, 1], 2]
names(y_data) <- "activity"

## 4. Appropriately label data set with descriptive variable names.
# correct column name; bind all data in single data set
names(subject_data) <- "subject"
all_data <- cbind(x_data, y_data, subject_data)

names(all_data) <- gsub("^t", "time", names(all_data))
names(all_data) <- gsub("^f", "frequency", names(all_data))
names(all_data) <- gsub("BodyBody", "Body", names(all_data))

## 5. From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
## Subset final data table to keep only desired columns, averages
## Create data set as a .txt file with write.table() using row.name=FALSE 
library(plyr)
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
names(averages_data)
View(averages_data)
write.table(averages_mean, "averages_data", row.names = FALSE, quote = FALSE)

## This command created file that included std dev.
## Alternative code was tried with the following:

## Need to SUBSET averages_mean to select ONLY variables with Mean in title
library(dplyr)
averages_mean <- subset(averages_data, select=c("mean"))
names(averages_mean)
View(averages_mean)

## Upload tidy data set created in step 5 to Coursera Project Submission page. 
## NOTE: (do not cut and paste a dataset directly into the text box, as this 
## may cause errors saving your submission).