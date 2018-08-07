# TidyDataAssignment
Getting &amp; Cleaning data.
required library(data.table) ,library(dplyr)
Reading the text data using read.table()
Varible names  are stored in features.
all data are readed test data, train data, subject data.
cbind to assemble 
col names by fauters data
Arranging data using sapply and grepl functions.

using rbind assemble both test & train data

group by subject number and activity and get the mean by gruopwise which is needed for us to complete this assignment

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all variables.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.
