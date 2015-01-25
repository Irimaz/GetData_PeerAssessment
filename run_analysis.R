# Merging the training and the test sets to create one data set.
# ---------------------

## Reading files to R
# The downloaded data should be unzipped to the working directory inside a folder called "UCI HAR Dataset"

# Reading training dataset
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")  #Training dataset
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")   # activities for training set
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")   # Subject for training set

# Reading test dataset
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")  #test dataset
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")   # activities for test set
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")   # Subject for test set

# Merging different components of the training dataset
train <- cbind(X_train, subject_train, y_train)


# Merging different components the test dataset
test <- cbind(X_test, subject_test, y_test)

# Merging train and test datasets to a combined larger dataset
combined <- rbind(train, test)


# Extracting only the measurements on the mean and standard deviation for each measurement. 
# ---------------------
# Reading the variable names into R
features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

# Selecting only mean and standard deviation values
mnstd_log <- grepl("mean()|std()", features$V2) 
features_mnstd <- features[mnstd_log,] 
combined_mnstd <- combined[,mnstd_log]

# Using descriptive activity names to name the activities in the data set
# ---------------------
# Manually replacing the number codes with the descriptive texts for activity variable

combined_mnstd$activity[combined_mnstd$V1.2 == 1] <- "WALKING"
combined_mnstd$activity[combined_mnstd$V1.2 == 2] <- "WALKING_UPSTAIRS"
combined_mnstd$activity[combined_mnstd$V1.2 == 3] <- "WALKING_DOWNSTAIRS"
combined_mnstd$activity[combined_mnstd$V1.2 == 4] <- "SITTING"
combined_mnstd$activity[combined_mnstd$V1.2 == 5] <- "STANDING"
combined_mnstd$activity[combined_mnstd$V1.2 == 6] <- "LAYING"
combined_mnstd$V1.2 <- NULL

# Appropriately labelling the data set with descriptive variable names. 
# --------------------- 
# Replacing the variable names from default values (e.g. V.1) to descriptive names 
# from feature names extracted above
labels <- c(features_mnstd$V2, "SubjectID", "Activity")
names(combined_mnstd) <- labels

# From the data set in step 4, creating a second, independent tidy data set with the 
# average of each variable for each activity and each subject.
# -------------------
# The follwing section require "dplyr" package. Please install it using "install.packages("dplyr")" if
# it is not installed.

library(dplyr)
# Creating 180 groups for activity-subject combinations and then calculating their mean for all variables.
by_sbj_act <- group_by(combined_mnstd, SubjectID, Activity)
grouped_data <- summarise_each(by_sbj_act, funs(mean))
# Writing the tidy dataset to a file
write.table(grouped_data, file="./Final_tidy_data_grouped.txt", row.name=FALSE)




