library(dplyr)

# download zip file containing data if it hasn't already been downloaded
dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataZip <- "UCI HAR Dataset.zip"

if (!file.exists(dataZip)) {
  download.file(dataUrl, dataZip, mode = "wb")
}

# unzip zip file containing data if data directory doesn't already exist
dataPath <- "UCI HAR Dataset"
if (!file.exists(dataPath)) {
  unzip(dataZip)
}

# Read in the data 
# Read in the trainging data

trainingData <- read.table(file.path(dataPath, "train", "X_train.txt"))
trainingPeople <- read.table(file.path(dataPath, "train", "subject_train.txt"))
trainingLabel <- read.table(file.path(dataPath, "train", "y_train.txt"))

# Read in the test data
testData <- read.table(file.path(dataPath, "test", "X_test.txt"))
testPeople <- read.table(file.path(dataPath, "test", "subject_test.txt"))
testLabel <- read.table(file.path(dataPath, "test", "y_test.txt"))

# read in the feature data
features <- read.table(file.path(dataPath, "features.txt"), as.is = TRUE)

# read in the activity data
activities <- read.table(file.path(dataPath, "activity_labels.txt"))
colnames(activities) <- c("activityId", "activityLabel")

# Combine the data into a single data set
trainingSet <- cbind(trainingPeople,trainingData, trainingLabel)
testSet <- cbind(testPeople, testData, testLabel)
completeSet <- rbind(trainingSet, testSet)
colnames(completeSet) <- c("subject", features[, 2], "activity")

# remove singular tables to save space
rm(trainingData, trainingLabel, trainingPeople, testData, testLabel, testPeople)

# Determine which columns of the data to keep
keepColumns <- grep('subject|mean|std|activity', colnames(completeSet))
completeSet <- completeSet[, keepColumns]

completeSet$activity <- factor(completeSet$activity, levels = activities[, 1], labels = activities[, 2])

# get column names
colCompleteSet <- colnames(completeSet)

# remove special characters
colCompleteSet <- gsub("[\\(\\)-]", "", colCompleteSet)

# expand abbreviations and clean up names
colCompleteSet <- gsub("^f", "Frequency_Domain", colCompleteSet)
colCompleteSet <- gsub("^t", "Time_Domain", colCompleteSet)
colCompleteSet <- gsub("Acc", "Accelerometer", colCompleteSet)
colCompleteSet <- gsub("Gyro", "Gyroscope", colCompleteSet)
colCompleteSet <- gsub("Mag", "Magnitude", colCompleteSet)
colCompleteSet <- gsub("Freq", "Frequency", colCompleteSet)
colCompleteSet <- gsub("mean", "Mean", colCompleteSet)
colCompleteSet <- gsub("std", "StandardDeviation", colCompleteSet)

# correct typo
colCompleteSet <- gsub("BodyBody", "Body", colCompleteSet)

# use new labels as column names
colnames(completeSet) <- colCompleteSet

# group by subject and activity and summarise using mean
completeSetMeans <- completeSet %>% 
  group_by(subject, activity) %>%
  summarise_each(funs(mean))

# output to file "tidy_data.txt"
write.table(completeSetMeans, "average_data.txt", row.names = FALSE, 
            quote = FALSE)
