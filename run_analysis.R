# TidyDataAssignment
Getting &amp; Cleaning data.
## Place this script in the folder containing "UCI HAR Dataset" folder

library(data.table)
library(dplyr)


#get column labels
setwd("./UCI HAR Dataset")
features <- read.table("features.txt")
features <- sapply(features[[2]],tolower)
features <- as.vector(features)

#get training data
setwd("./train")
y_train <- read.table("y_train.txt")
y_train <- as.numeric(y_train[[1]])
y_train <- gsub(y_train,1,"WALKING")
y_train <- gsub(y_train,2,"WALKING_UPSTAIRS")
y_train <- gsub(y_train,3,"WALKING_DOWNSTAIRS")
y_train <- gsub(y_train,4,"SITTING")
y_train <- gsub(y_train,5,"STANDING")
y_train <- gsub(y_train,6,"LAYING")
x_train <- read.table("x_train.txt")
subject_train <- read.table("subject_train.txt")

#get test data
setwd("../test")
y_test <- read.table("y_test.txt")
y_test <- as.numeric(y_test[[1]])
y_test <- gsub(y_test,1,"WALKING")
y_test <- gsub(y_test,2,"WALKING_UPSTAIRS")
y_test <- gsub(y_test,3,"WALKING_DOWNSTAIRS")
y_test <- gsub(y_test,4,"SITTING")
y_test <- gsub(y_test,5,"STANDING")
y_test <- gsub(y_test,6,"LAYING")
x_test <- read.table("x_test.txt")
subject_test <- read.table("subject_test.txt")

#assemble data set
test_data <- cbind(subject_test,y_test,x_test)
training_data <- cbind(subject_train,y_train,x_train)

#labels
colnames(test_data) <- c("subjectnumber","activity",features)
colnames(training_data) <- c("subjectnumber","activity",features)

#arrange data
test_data <- test_data[,sapply(colnames(test_data),
                function (x) grepl('-mean()|-std()|subjectnumber|activity',x))]
training_data <- training_data[,sapply(colnames(training_data),
                function (x) grepl('-mean()|-std()|subjectnumber|activity',x))]
full_data <- rbind(test_data,training_data)

#get averages
full_data <- full_data %>% group_by(subjectnumber,activity) %>%
                summarize_all(mean)

print(head(full_data))
