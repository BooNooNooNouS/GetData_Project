# Codebook for the data set
---
## Data source
This data comes from the [Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and displays the results of a number of experiments with a group of 30 volunteers performing 6 different activities and wearing a smartphone capable of collecting information using the accelerometer, gyroscope.  From these measures the data was partitioned into a set of training data (70%) and a set of test data (30%).

This data was provided in a folder named _UCI HAR Dataset_ containing the following file structure:
* UCI HAR Dataset
  + test  
    - subject_test.txt  
    - X_test.txt  
    - y_test.txt  
  + train  
    - subject_train.txt  
    - X_train.txt  
    - y_train.txt  

## Transformations to the data set
The final dataset consists of the following columns:
* activity  
* subject  
* tBodyAcc.mean...X  
* tBodyAcc.mean...Y  
* tBodyAcc.mean...Z  
* tGravityAcc.mean...X  
* tGravityAcc.mean...Y  
* tGravityAcc.mean...Z  
* tBodyAccJerk.mean...X  
* tBodyAccJerk.mean...Y  
* tBodyAccJerk.mean...Z  
* tBodyGyro.mean...X  
* tBodyGyro.mean...Y  
* tBodyGyro.mean...Z  
* tBodyGyroJerk.mean...X  
* tBodyGyroJerk.mean...Y  
* tBodyGyroJerk.mean...Z  
* tBodyAccMag.mean..  
* tGravityAccMag.mean..  
* tBodyAccJerkMag.mean..  
* tBodyGyroMag.mean..  
* tBodyGyroJerkMag.mean..  
* fBodyAcc.mean...X  
* fBodyAcc.mean...Y  
* fBodyAcc.mean...Z  
* fBodyAcc.meanFreq...X  
* fBodyAcc.meanFreq...Y  
* fBodyAcc.meanFreq...Z  
* fBodyAccJerk.mean...X  
* fBodyAccJerk.mean...Y  
* fBodyAccJerk.mean...Z  
* fBodyAccJerk.meanFreq...X  
* fBodyAccJerk.meanFreq...Y  
* fBodyAccJerk.meanFreq...Z  
* fBodyGyro.mean...X  
* fBodyGyro.mean...Y  
* fBodyGyro.mean...Z  
* fBodyGyro.meanFreq...X  
* fBodyGyro.meanFreq...Y  
* fBodyGyro.meanFreq...Z  
* fBodyAccMag.mean..  
* fBodyAccMag.meanFreq..  
* fBodyBodyAccJerkMag.mean..  
* fBodyBodyAccJerkMag.meanFreq..  
* fBodyBodyGyroMag.mean..  
* fBodyBodyGyroMag.meanFreq..  
* fBodyBodyGyroJerkMag.mean..  
* fBodyBodyGyroJerkMag.meanFreq..  
* angle.tBodyAccMean.gravity.  
* angle.tBodyAccJerkMean..gravityMean.  
* angle.tBodyGyroMean.gravityMean.  
* angle.tBodyGyroJerkMean.gravityMean.  
* angle.X.gravityMean.  
* angle.Y.gravityMean.  
* angle.Z.gravityMean.  
* tBodyAcc.std...X  
* tBodyAcc.std...Y  
* tBodyAcc.std...Z  
* tGravityAcc.std...X  
* tGravityAcc.std...Y  
* tGravityAcc.std...Z  
* tBodyAccJerk.std...X  
* tBodyAccJerk.std...Y  
* tBodyAccJerk.std...Z  
* tBodyGyro.std...X  
* tBodyGyro.std...Y  
* tBodyGyro.std...Z  
* tBodyGyroJerk.std...X  
* tBodyGyroJerk.std...Y  
* tBodyGyroJerk.std...Z  
* tBodyAccMag.std..  
* tGravityAccMag.std..  
* tBodyAccJerkMag.std..  
* tBodyGyroMag.std..  
* tBodyGyroJerkMag.std..  
* fBodyAcc.std...X  
* fBodyAcc.std...Y  
* fBodyAcc.std...Z  
* fBodyAccJerk.std...X  
* fBodyAccJerk.std...Y  
* fBodyAccJerk.std...Z  
* fBodyGyro.std...X  
* fBodyGyro.std...Y  
* fBodyGyro.std...Z  
* fBodyAccMag.std..  
* fBodyBodyAccJerkMag.std..  
* fBodyBodyGyroMag.std..  
* fBodyBodyGyroJerkMag.std..

The naming conventions follow the same as in the original dataset, where:  
t = time  
f = frequency  
XYZ = spatial coordinates  