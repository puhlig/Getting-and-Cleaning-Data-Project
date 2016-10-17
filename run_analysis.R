## Getting and Cleaning Data 
## Final Project

## The given zip file's contents were unzipped into local 
## directory ./data/FUCI HAR Dataset/

locPath <- "./data/FUCI HAR Dataset/"

## Load activity labels and replace underscores with spaces for readability
activityLabels <- read.table(paste0(locPath,"activity_labels.txt"))
activityLabels$V2 <- gsub("_"," ",activityLabels$V2)

## load the feature labels (these will be the variable labels for the measurement data)
features <- read.table(paste0(locPath,"features.txt"))
## NOTE: feature descriptions were not "tolower"-ed to maintain consistency with original function desscriptions

## Load the testing and training variables (each with subject, X, and y)
subjecttest <- read.table(paste0(locPath,"test/subject_test.txt"))
Xtest <- read.table(paste0(locPath,"test/X_test.txt"))
ytest <- read.table(paste0(locPath,"test/y_test.txt"))

subjecttrain <- read.table(paste0(locPath,"train/subject_train.txt"))
Xtrain <- read.table(paste0(locPath,"train/X_train.txt"))
ytrain <- read.table(paste0(locPath,"train/y_train.txt"))

## put the appropriate activity label (factor value label) on test and training variables
ytest$V1 <- factor(ytest$V1,labels=activityLabels$V2)
ytrain$V1 <- factor(ytrain$V1,labels=activityLabels$V2)

## combine the test and training data in each category (subject, X, and y)
subject <- rbind(subjecttest,subjecttrain)
colnames(subject) <- "subject"                  # name the subject data column "subject"
Xmeasurements <- rbind(Xtest,Xtrain)
colnames(Xmeasurements) <- features$V2          # names the columns of the X data with the names from features
activity <- rbind(ytest,ytrain)
colnames(activity) <- "activity"                # name the activity data column "activity"

## combine the columns of subject, activity, and Xmeasurements into one data frame
mergedData <- cbind(subject,activity,Xmeasurements)

## Project step 2 - extract only those columns for 'mean' or 'std' (mean or standard deviation)

MEANandSTDcols <- append(c(TRUE,TRUE),grepl("mean|std",features$V2))
extractedMeanStdData <- mergedData[,MEANandSTDcols]

## Calculate the mean of each the extracted mean and std variables with respect activity and subject store in meanData

meanData <-aggregate(extractedMeanStdData[-(1:2)], by=extractedMeanStdData[c("subject","activity")], FUN=mean, na.rm=TRUE)

