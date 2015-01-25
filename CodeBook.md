#Codebook
This document is the codebook for the peer assessment project for getting and cleaning data course and provides variable metadata.

#Background: 
Accrording to assignment description, wearable computing is an exciting area of research in data science in which many companies try to develop algorithms to analyse the data captured from these devices. In this case, the data from the Samsung Galaxy S was collected from 30 subjects performing different actvities including walking, walking upstairs, walking downstairs, sitting, standing and laying. 


#Raw data:
The raw data was downloaded from the following address: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip". The data then was unzipped to the working directory and inspected. The data set contains different text files for training (X_train.txt) and testing (X_test.txt) sets. Other files used to create the tidy dataset were "feature.txt" providing the variable names, "subject_train.txt" and "subject_test.txt" providing the ID for 30 subjects and "y_train.txt" and "y_test.txt" providing the actvity names by using "activity_labels.txt". 

#Processed data:
The processed tidy data was created by running the "run_analysis.R" code. The code reads the collected data and their accompanying activity and subject text files into R and combines them into one dataframe for training and test data sets. Then, it combines training and test datasets into one dataframe of 10299 rows of 563 variables. Next, the variable names are extracted from "feature.txt" file and a subset of 79 variables for only mean and standard deviation is selected and the combined dataset is subsetted to include only these 79 variables. Follwoing this, the activity ID is replaced by meaningful descriptions such as walking, sitting, .... Next, variable names are replaced with the actual names from the "feature.txt" file. Finally, the tidy data is created by taking the mean of each variable for 180 activity-subject combinations and the tidy data was written to a text file. 
The tidy data includes 180 observations of 81 variables. Variables are mean of mean and standard deviation for 180 possible activity-subject combinations noted by std(), mean() and meanFreq() suffixes. 
The variables include the following time-domain transformations (denoted by t). Those measurement made in 3-axes have the XYZ suffix (one variable for each axis). Acc shows the data acquired using accelerometer (in standard gravity units) and Gyro show data captured using gyroscope. Jerk and Mag shows the jerk and magnitude calculations. The following is a list of the variables:

- TbodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag

Additionally, the tidy dataset includes frequency-domain transformations denoted by f prefix. The following list shows these variables.

- FbodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag
