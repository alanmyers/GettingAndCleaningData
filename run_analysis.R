# Files
#  features.txt - List of 561 labels that should be the col-names for X_Test
#  activity_labels.txt - Activity (e.g. 1 = walking, 2 = walking_upstairs...)
#  Data
#   X_test - The test / training data
#   y_test - Maps to activity labels (1-6)
#   subject_test - each row identifies the test subject (1-30)
# Functions
#  Get Data
#   Add feature_labels (column names)
#   Add activity_labels (walking, walking_upstairs...)
#   Add subject ids (test subject (1..30))
#   Create DF with mean and std columns
#  return Data frame
#
# merge test & training data
# Create new tidy data set with average of each varible and each subject
run_analysis <- function(nbRows = -1)
{
  # nbRows --> loading data... Avoid long processing times
  # -1 = all rows.  Otherwise a value of nb rows to read from
  # train and test data sets

  trainDataFile     <- "..\\UCI HAR Dataset\\train\\X_train.txt"
  trainLabelFile    <- "..\\UCI HAR Dataset\\train\\y_train.txt"
  trainSubjectFile  <- "..\\UCI HAR Dataset\\train\\subject_train.txt"
  
  testDataFile      <- "..\\UCI HAR Dataset\\test\\X_test.txt"
  testLabelFile     <- "..\\UCI HAR Dataset\\test\\y_test.txt"
  testSubjectFile   <- "..\\UCI HAR Dataset\\test\\subject_test.txt"
  
  colLabelFile      <- "..\\UCI HAR Dataset\\features.txt"
  activityLabelFile <- "..\\UCI HAR Dataset\\activity_labels.txt"
  
  
  trainData      <- read.csv(trainDataFile, sep="", header=FALSE, 
                             strip.white=T, nrows = nbRows)
  trainLabel     <- read.table(trainLabelFile, nrows= nbRows)
  trainSubject   <- read.table(trainSubjectFile, nrows=nbRows)
  
  testData       <- read.csv(testDataFile,  sep="", header=FALSE, 
                             strip.white=T, nrows = nbRows)
  testLabel      <- read.table(testLabelFile, nrows= nbRows)
  testSubject   <- read.table(testSubjectFile, nrows=nbRows)
  
  ActivityLabels <- read.table(activityLabelFile, nrows= nbRows)
  names(ActivityLabels) <- c("Id", "Name")
  # Get rid of the parans and commas in the column names.  
  #    E.g. angle(tBodyGyroMean,gravityMean)
  #    becomes angletBodyGyroMean.gravityMean
  #
  colLabels      <- read.table(colLabelFile)
  colLabels      <- gsub("\\(", "", colLabels$V2)
  colLabels      <- gsub("\\)", "", colLabels)
  colLabels      <- gsub("\\,", "\\.", colLabels)
    
  # Add in the column Names
  colnames(testData)  <- colLabels
  colnames(trainData) <- colLabels
  
  # Add in the activity labels
  testData$activityLabelId  <- as.vector(testLabel$V1)
  trainData$activityLabelId <- as.vector(trainLabel$V1)
  ##  Need to add the names into the testData & trainData frames. 
  ##  1 -> WALKING
  testData$activityLabelNames  <- as.character(apply(as.data.frame(testData[,'activityLabelId']), 
                                        1, function(x) ActivityLabels$Name[x]))
  trainData$activityLabelNames <- as.character(apply(as.data.frame(trainData[,'activityLabelId']), 
                                        1, function(x) ActivityLabels$Name[x]))
    
  # Add in the subjects column
  testData$subjectId  <- as.vector(testSubject$V1)
  trainData$subjectId <- as.vector(trainSubject$V1)
  
  # Merge Data Sets
  fullData <- rbind(testData, trainData)
  newNames <- vector()
  
  # Get only mean and std columns
  DataSet <- data.frame(subjectId=fullData$subjectId, activityName=fullData$activityLabelNames)  
  newNames <- as.vector(c("subjectId", "activityName"))
  #
  # Cnt starts at 2... since we have added columns.
  #
  cnt <- 2  
    
  for (name in names(fullData)) {    
    if (length(grep("Mean|mean|std", name)) != 0)
    {      
      cnt <- cnt + 1
      DataSet <- cbind(DataSet, as.vector(fullData[,name]))      
      newNames[cnt] = name
    }
    else {
     
    }
    
  }
  names(DataSet) <- as.vector(newNames)
  print("Done")
}

