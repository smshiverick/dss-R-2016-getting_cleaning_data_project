## Getting and Cleaning Data - Course Project

#### Sean M. Shiverick


### Data Set Information

The data for this project was taken from the 'Human Activity Recognition Using Smartphones Data Set' at the UCI Machine Learning Repository:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments were carried out with 30 volunteers (age range 19-48 years). Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

#### Attribute Information

For each record in the dataset the following information was provided: 

- Triaxial acceleration from accelerometer (total acceleration) and estimated body acceleration. 
- Triaxial Angular velocity from gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


#### Data Files

The source data for the project was downloaded from the following URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data file was unzipped in the UCI_HAR_Dataset, which contained major folders for the test data set and train data set, along with accompanying descriptive text files. The test data set contained the following data files: 

- X_test.txt 
- y_test.txt
- subject_test.txt

The train data set contained the following data files: 

- X_train.txt
- y_train.txt 
- subject_train.txt 

The Inertial Signals folders were not addressed in this project. 

### Cleaning and Organizing the Data Set

The script, run_analysis.R, contains the code for the 5 steps described in the course project instructions.

#### Step 1. Merge the training and test sets to create one data set.
(a) Read test and train files from UCI_HAR_Dataset:
X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt, subject_train.txt
(b) Create 'x' data set: x_data.txt, create 'y' data set: y_data.txt, create 'subject' data set: subject_data.txt 
(c) use rbind() to combine train and test data into single data set for each.

#### Step 2. Extract only measurements on the mean and std. dev. for each measurement.
(a) Select columns with mean() and std() in their names, and 
(b) Use features.txt to identify correct names for x_data.txt.

#### Step 3. Use descriptive activity names to name the activities in the data set.
(a) Use activity_labels.txt to identify activity names for y_data.txt.
(b) Update values with correct activity names, and correct column name.

#### Step 4. Appropriately label data set with descriptive variable names.
(a) Correct column name, subject.
(b) Use cbind() to combine x_data.txt, y_data.txt and subject_data.txt
into single inclusive data set called, all_data.txt.
(c) Change variables names in the complete data set. 

#### Step 5. Create a second, independent tidy data set (from data set in step 4) with the average of each variable for each activity and each subject.
(a) Use ddply() from plyr package to subset merged data table to keep desired columns, average measures for each subject, activity type.
(b) Write final data file that contains the relevant averages, averages_data.txt.
(c) Upload (git push) tidy data file to GitHub Repository: Coursera_Getting_Cleaning_Data_Project




---
date: "June 30, 2016"
output: html_document
---