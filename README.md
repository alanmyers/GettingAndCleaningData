Coursera - Getting and Cleaning Data project
============================================

This readme describes the run_analysis program and high level details around the week 3 project.  It also contains links to additional information. 

run_analysis(nbRows)
--------------------
- nbRows defaults to -1, which is all rows.
- nubRows = 100 -> read only 100 rows out of the data files.  Speeds debugging

run_analysis Description
-------------
Calls the following three helper functions.

- GetTheData -- Opens all files and pulls into R
- ReduceTheData -- Eliminates un-necessary columns
- GroupTheData -- Groups and summarizes

run_analysis returns a DataFrame which is grouped by SubjectId and ActivityName, and the values are all averages / means for that grouping

More Info
---------
See CodeBook.MD for details on the feature data, and various files that are used to pull it all together.  Namely

- data files (x_test, x_test, subject_test and x_train, y_train and subject_train)
- Linking files (activity_lables.txt)
- Reference files (README.txt, features_info.txt and features.txt)
