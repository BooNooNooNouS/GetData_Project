# GetData_Project
Proyect for the Getting and Cleaning Data class in Coursera  


## Introduction
This repository contains the final project for the Coursera course "Getting and cleaning data".  


## Contents and definitions
This repository contains the following files:  
- run_analysis.R  
- CodeBook.md  
- tidy.txt  

## Executing run_analysis.R

### Prerequisites:
run_analysis.R needs to be run in the same folder where the original dataset was extracted.  The script will look for a directory named __"UCI HAR Dataset"__ and if it is not found, an error will be thrown.
It is assumed that the dataset was extracted and no data was modified.  This script depends on the existence of
X_<set>.txt, y_<set>.txt, subject_<set>.txt, activity_labels.txt, and features.txt, where <set> can be either test or train.

### Operations:
The script starts by creating test and train tables by concatenating subject, activity, and features for each collection.  While doing this, the names corresponding to the different features are obtained by parsing them from the features.txt file.  

Once we have merged_train and merged_test tables of dimensions [X,563], the script concatenates this to create one set called merged_sets with dimensions [10299,563].  

The next step is to use only the columns related to mean and standard deviation which is achieved by means of the contains function, resulting in a dataset of dimensions [10299, 88] since activity and subject are still included.  

Given that the activity column has only the numeric values for the activities, we replace those with the character values located in the activity_labels.txt file, for this, a helper function is created to locate the correct label that corresponds to the index.  This modifies the original merged_sets table but not the dimensions of it.

Finally, an additional variable is created with name averaged_set, which calculates the average of each column per activity and subject.  To achieve this, we took the merged_sets variable, grouped it by activity and subject and then calculated the mean for each remaining column.

At the end of the script, the environment should be exactly the same as in the beginning, with the addition of the two data frames mentioned above: merged_sets, and averaged_set