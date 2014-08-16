Codebook
--------

The final dataset is in **tidyData.txt** file. It contains 35 observations of 50 variables.

This dataset was created from this data:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Description

The variables in the final dataset are:

  * Subject.Id - The id of the subject performing the activity
  * Activity - The type of the activity performed (one of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
  * Other variables

Other variables are in the form *SignalType*-*Transformation*-*Axis*. The values are the average of each variable in the original dataset for each activity and each subject. Here's the quote from *features_info.txt* file explaining the variables' names:

> [The data] come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
>
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
>
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

### Obtaining cleaned data

The steps to produce the cleaned dataset are the following:

  1. Read and merge the training and testing datasets (files *train/X_train.txt*, *train/y_train.txt*, *train/subject_train.txt*, *test/X_test.txt*, *test/y_test.txt*, *test/subject_test.txt*).
  2. Set the names for features as described in *features.txt* file.
  3. Extract the variables describing mean and standard deviation.
  4. Replace activity ids with proper names as described in *activity_labels.txt* file.
  5. Reshape the data to create a dataset with the average of each variable for each activity and each subject.
