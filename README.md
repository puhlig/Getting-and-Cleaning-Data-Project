# Getting-and-Cleaning-Data-Project
This repository has the results of my end of course project

Here are the steps of the tidying process

The given zip file's contents were unzipped into local 
directory ./data/FUCI HAR Dataset/ 

This can be changed immediately by adjusting the locPath variable

Load activity labels and replace underscores with spaces for readability

load the feature labels (these will be the variable labels for the measurement data)

NOTE: feature descriptions were not "tolower"-ed to maintain consistency with original function desscriptions

Load the testing and training variables (each with subject, X, and y)

put the appropriate activity label (factor value label) on test and training variables

combine the test and training data in each category (subject, X, and y) naming the subject and activity variables

combine the columns of subject, activity, and Xmeasurements into one data frame

Extract only those columns for 'mean' or 'std' (mean or standard deviation)

Calculate the mean of each the extracted mean and std variables with respect activity and subject store in meanData

Write the final tidy data set.

