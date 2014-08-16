# Getting data

if (!file.exists('dataset.zip')) {
  download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
                destfile='dataset.zip')
}

if (!file.exists('UCI HAR Dataset')) {
  unzip('dataset.zip')
}

setwd('UCI HAR Dataset')

# Reading and binding datasets

data_X <- rbind(read.table('train/X_train.txt'),
                read.table('test/X_test.txt'))
data_y <- rbind(read.table('train/y_train.txt', col.names='Activity.Id'),
                read.table('test/y_test.txt', col.names='Activity.Id'))
data_subj <- rbind(read.table('train/subject_train.txt', col.names='Subject.Id'),
                   read.table('test/subject_test.txt', col.names='Subject.Id'))

# Setting proper names for features

features <- read.table('features.txt', col.names=c('Feature.Id', 'Feature.Name'))
names(data_X) <- features$Feature.Name

# Extracting mean and std

col_idx <- grep("-(mean|std)\\(\\)-", features$Feature.Name)
mean_std_data_X <- data_X[, col_idx]

# Naming activities

activities <- read.table('activity_labels.txt', col.names=c('Activity.Id', 'Activity'))
data_y <- merge(data_y, activities)
data_y$Activity.Id <- NULL

# Creating and writing final tidy dataset

library(reshape2)

tidyData <- cbind(data_subj, data_y, mean_std_data_X)
tidyDataAvg <- dcast(melt(tidyData, id.vars=c('Subject.Id', 'Activity')),
                     Subject.Id + Activity ~ variable,
                     mean)
setwd('..')
write.table(tidyDataAvg, file='tidyData.txt', row.names=F)
