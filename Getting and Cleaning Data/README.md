# Coursera *Getting and Cleaning Data* course project

This repository contains the following files:

- `README.md`, this file, which provides an overview on how the analysis was done and a procedure of how to run the analysis
- `average_data.txt`, which contains the data set.
- `CodeBook.md`, the code book that explains all the data and variable used in the analysis.
- `run_analysis.R`, the R script that was used to do the analysis as well as create the new data set. 

## Creating the data set

The R script `run_analysis.R` can be used to create the data set. It retrieves the source data set and transforms it to produce the final data set by implementing the following steps (see the Code book for details, as well as the comments in the script itself):

- Download and unzip source data if it doesn't exist.
- Read data.
- Merge the training and the test sets to create one data set.
- Extract only the measurements on the mean and standard deviation for each measurement.
- Use descriptive activity names to name the activities in the data set.
- Appropriately label the data set with descriptive variable names.
- Create a second, independent tidy set with the average of each variable for each activity and each subject.
- Write the data set to the `average_data.txt` file.

