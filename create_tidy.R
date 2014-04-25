create_tidy <- function(directory) {

# Section 1: Merges the training and the test sets to create one data set.#

## Import individual training and test files ##
subject_train <- read.delim(paste(directory,"/train/subject_train.txt", sep=""), header=F)
X_train <- read.table(paste(directory,"/train/X_train.txt", sep=""), quote="\"")
y_train <- read.delim(paste(directory,"/train/y_train.txt", sep=""), header=F)

subject_test <- read.delim(paste(directory,"/test/subject_test.txt", sep=""), header=F)
X_test <- read.table(paste(directory,"/test/X_test.txt", sep=""), quote="\"")
y_test <- read.delim(paste(directory,"/test/y_test.txt", sep=""), header=F)

## Append training and test files for each variable ##
subject <- unlist(append(subject_test,subject_train))
y <- unlist(append(y_test,y_train))
x <- rbind(X_test, X_train)

## Merge variables as data frame ##
full <- data.frame(subject,y,x)



# Section 2: Extracts only the measurements on the mean and standard deviation for each measurement. #

keep <- c('subject', 'y', 'V1', 'V2', 'V3', 'V4', 'V5', 'V6', 'V41', 'V42', 'V43', 'V44', 'V45',
          'V46', 'V81', 'V82', 'V83', 'V84', 'V85', 'V86', 'V121', 'V122', 'V123',
          'V124', 'V125', 'V126', 'V161', 'V162', 'V163', 'V164', 'V165', 'V166',
          'V201', 'V202', 'V214', 'V215', 'V227', 'V228', 'V240', 'V241', 'V253',
          'V254', 'V266', 'V267', 'V268', 'V269', 'V270', 'V271', 'V345', 'V346',
          'V347', 'V348', 'V349', 'V350', 'V424', 'V425', 'V426', 'V427', 'V428',
          'V429', 'V503', 'V504', 'V516', 'V517', 'V529', 'V530', 'V542', 'V543')
tidy <- subset(full,select=keep)



# Section 3: Uses descriptive activity names to name the activities in the data set  #
tidy$A_Code <- tidy$y

tidy$y <- as.factor(tidy$y)
levels(tidy$y) <- c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING')



# Section 4: Appropriately labels the data set with descriptive [variable] names.

colnames(tidy) <- c("ID", "Activity","tBodyAcc-mean()X ","tBodyAcc-mean()Y ","tBodyAcc-mean()Z ",
                    "tBodyAcc-std()X ","tBodyAcc-std()Y ","tBodyAcc-std()Z ","tGravityAcc-mean()X ",
                    "tGravityAcc-mean()Y ","tGravityAcc-mean()Z ","tGravityAcc-std()X ",
                    "tGravityAcc-std()Y ","tGravityAcc-std()Z ","tBodyAccJerk-mean()X ",
                    "tBodyAccJerk-mean()Y ","tBodyAccJerk-mean()Z ","tBodyAccJerk-std()X ",
                    "tBodyAccJerk-std()Y ","tBodyAccJerk-std()Z ","tBodyGyro-mean()X ","tBodyGyro-mean()Y ",
                    "tBodyGyro-mean()Z ","tBodyGyro-std()X ","tBodyGyro-std()Y ","tBodyGyro-std()Z ",
                    "tBodyGyroJerk-mean()X ","tBodyGyroJerk-mean()Y ","tBodyGyroJerk-mean()Z ",
                    "tBodyGyroJerk-std()X ","tBodyGyroJerk-std()Y ","tBodyGyroJerk-std()Z ",
                    "tBodyAccMag-mean() ","tBodyAccMag-std() ","tGravityAccMag-mean() ",
                    "tGravityAccMag-std() ","tBodyAccJerkMag-mean() ","tBodyAccJerkMag-std() ",
                    "tBodyGyroMag-mean() ","tBodyGyroMag-std() ","tBodyGyroJerkMag-mean() ",
                    "tBodyGyroJerkMag-std() ","fBodyAcc-mean()X ","fBodyAcc-mean()Y ","fBodyAcc-mean()Z ",
                    "fBodyAcc-std()X ","fBodyAcc-std()Y ","fBodyAcc-std()Z ","fBodyAccJerk-mean()X ",
                    "fBodyAccJerk-mean()Y ","fBodyAccJerk-mean()Z ","fBodyAccJerk-std()X ","fBodyAccJerk-std()Y ",
                    "fBodyAccJerk-std()Z ","fBodyGyro-mean()X ","fBodyGyro-mean()Y ","fBodyGyro-mean()Z ",
                    "fBodyGyro-std()X ","fBodyGyro-std()Y ","fBodyGyro-std()Z ","fBodyAccMag-mean() ",
                    "fBodyAccMag-std() ","fBodyBodyAccJerkMag-mean() ","fBodyBodyAccJerkMag-std() ",
                    "fBodyBodyGyroMag-mean() ","fBodyBodyGyroMag-std() ","fBodyBodyGyroJerkMag-mean() ",
                    "fBodyBodyGyroJerkMag-std() ", "Activity_Code")



## Clean Workspace ##
rm(X_test,X_train,y_test,y_train,x,y,subject,subject_test,subject_train,full,keep)

return(tidy)
}