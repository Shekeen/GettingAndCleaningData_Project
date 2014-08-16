Getting and Cleaning Data Course Project
---------------------------------------------------------

The goal of this project is to create a clean dataset from data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The **run_analysis.R** R script contains the R code that does the following:

  1. Downloads and unzips the original data.
  2. Reads and merges the training and testing datasets.
  3. Sets the names for features as described in *features.txt*.
  4. Extracts the variables describing mean and standard deviation.
  5. Replaces activity ids with proper names as described in *activity_labels.txt*
  6. Reshapes the data to create a dataset with the average of each variable for each activity and each subject.
  7. Writes this dataset into *tidyData.txt* file.

The **codebook.md** file describes the output dataset, which is stored in **tidyData.txt** file.
