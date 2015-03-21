CodeBook 
========

DataSource
----------
The data was pulled from "Human Activity Recognition Using Smartphones Data Set" on the UCI Machine Learning Repository website using the following URLS

- Description Infromatin: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
- Data URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original Data Set
-----------------
THe zip file in the DATA URL contains relevant informaiton.  Look at the following defintional files

- README.txt: Description of the experment, details on each file.
- features_info.txt:  A view description of the dataset variables and their groupings (mean, std, min, max, etc)
- features.txt: A full listing of the original dataset variables.
- activity_labels.txt: Maps the activityId to a name -- 1 == WALKING.

Also look at the following data files (in the test and train folders)

- subject_test.txt: listing of subject ids for each observation row (from 1 to 30)
- X_test.txt: The measurements
- y_test.txt: The activity ids associated with each measurement row in X_test
- Folder: Internial_signals: Not used.
- subject_train.txt, X_train.txt and y_train.txt correspond to the training data set.

Transformed Data Set
-------------------
The following functions were applied to generate the resulting data set

GetTheData    -- Opens all files and pulls into R.  Files used:

  + activity_labels, X_test.txt, Y_test.txt, sbuject_tests.txt (and train data)
  + test and train sets are merged together

ReduceTheData -- Eliminates un-necessary columns

  + Remaining columns include Mean / mean and std calculations 

GroupTheData  -- Groups and summarizes

  + Groups by subjectId and activityName.
  + Calculates the average for each observation based on groupings.

Resulting DataSet includes the following variables:
--------------------------------------------------
- subjectId
- activityName
- tBodyAcc-mean-X
- tBodyAcc-mean-Y
- tBodyAcc-mean-Z
- tBodyAcc-std-X
- tBodyAcc-std-Y
- tBodyAcc-std-Z
- tGravityAcc-mean-X
- tGravityAcc-mean-Y
- tGravityAcc-mean-Z
- tGravityAcc-std-X
- tGravityAcc-std-Y
- tGravityAcc-std-Z
- tBodyAccJerk-mean-X
- tBodyAccJerk-mean-Y
- tBodyAccJerk-mean-Z
- tBodyAccJerk-std-X
- tBodyAccJerk-std-Y
- tBodyAccJerk-std-Z
- tBodyGyro-mean-X
- tBodyGyro-mean-Y
- tBodyGyro-mean-Z
- tBodyGyro-std-X
- tBodyGyro-std-Y
- tBodyGyro-std-Z
- tBodyGyroJerk-mean-X
- tBodyGyroJerk-mean-Y
- tBodyGyroJerk-mean-Z
- tBodyGyroJerk-std-X
- tBodyGyroJerk-std-Y
- tBodyGyroJerk-std-Z
- tBodyAccMag-mean
- tBodyAccMag-std
- tGravityAccMag-mean
- tGravityAccMag-std
- tBodyAccJerkMag-mean
- tBodyAccJerkMag-std
- tBodyGyroMag-mean
- tBodyGyroMag-std
- tBodyGyroJerkMag-mean
- tBodyGyroJerkMag-std
- fBodyAcc-mean-X
- fBodyAcc-mean-Y
- fBodyAcc-mean-Z
- fBodyAcc-std-X
- fBodyAcc-std-Y
- fBodyAcc-std-Z
- fBodyAcc-meanFreq-X
- fBodyAcc-meanFreq-Y
- fBodyAcc-meanFreq-Z
- fBodyAccJerk-mean-X
- fBodyAccJerk-mean-Y
- fBodyAccJerk-mean-Z
- fBodyAccJerk-std-X
- fBodyAccJerk-std-Y
- fBodyAccJerk-std-Z
- fBodyAccJerk-meanFreq-X
- fBodyAccJerk-meanFreq-Y
- fBodyAccJerk-meanFreq-Z
- fBodyGyro-mean-X
- fBodyGyro-mean-Y
- fBodyGyro-mean-Z
- fBodyGyro-std-X
- fBodyGyro-std-Y
- fBodyGyro-std-Z
- fBodyGyro-meanFreq-X
- fBodyGyro-meanFreq-Y
- fBodyGyro-meanFreq-Z
- fBodyAccMag-mean
- fBodyAccMag-std
- fBodyAccMag-meanFreq
- fBodyBodyAccJerkMag-mean
- fBodyBodyAccJerkMag-std
- fBodyBodyAccJerkMag-meanFreq
- fBodyBodyGyroMag-mean
- fBodyBodyGyroMag-std
- fBodyBodyGyroMag-meanFreq
- fBodyBodyGyroJerkMag-mean
- fBodyBodyGyroJerkMag-std
- fBodyBodyGyroJerkMag-meanFreq
- angletBodyAccMean.gravity
- angletBodyAccJerkMean.gravityMean
- angletBodyGyroMean.gravityMean
- angletBodyGyroJerkMean.gravityMean
- angleX.gravityMean
- angleY.gravityMean
- angleZ.gravityMean
