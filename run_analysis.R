#You should create one R script called run_analysis.R that does the following. 

#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each 
#   measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.

# It is assumed that a folder UCI HAR Dataset is located on the working 
# directory.  Inside there should be 2 folders: test, and train. Before 
# performing any operations, ensure that the files exist and throw an error if 
# they don't.
if(!file.exists(".//UCI HAR Dataset"))
  stop("Required folder 'UCI HAR Dataset' does not exist in the current working directory.")

# Load all the required libraries
library(data.table)
library(dplyr)
library(tidyr)

# ===Step 1: Merge training and test sets to create one data set ==============
#
# Generate the merged training table and test table:
# There's a total of 30 subjects (subject_<set>) performing 6 activities (y_<set>) 
# that result in the values displayed at x_<set>.  The first step is to generate 
# a table where all of these values exist together.  The merged_<set> variables 
# will contain subject, activity, features.
#
# Once we have merged_test and merged_train we will merge them together to have
# one table with the combined test and train data sets.
#
# =============================================================================
merged_train  <- read.table(".//UCI HAR Dataset//train//subject_train.txt", col.names = c("subject")) %>% 
  bind_cols (read.table(".//UCI HAR Dataset//train//y_train.txt", col.names = c("activity"))) %>%
  bind_cols (read.table(".//UCI HAR Dataset//train//x_train.txt")) %>% tbl_df

print(
  sprintf("DBG: merged_train calculated with dimensions: [%s, %s]", 
          dim(merged_train)[1], 
          dim(merged_train)[2]))

merged_test  <- read.table(".//UCI HAR Dataset//test//subject_test.txt", col.names = c("subject")) %>% 
  bind_cols (read.table(".//UCI HAR Dataset//test//y_test.txt", col.names = c("activity"))) %>%
  bind_cols (read.table(".//UCI HAR Dataset//test//x_test.txt")) %>% tbl_df

print(
  sprintf("DBG: merged_test calculated with dimensions: [%s, %s]", 
          dim(merged_test)[1], 
          dim(merged_test)[2]))

merged_sets <- bind_rows(merged_train, merged_test) %>%
  tbl_df
rm("merged_train", "merged_test") #clean-up memory since we don't need these variables anymore
print(
  sprintf("DBG: merged_sets calculated with dimensions: [%s, %s]", 
          dim(merged_sets)[1], 
          dim(merged_sets)[2]))


# ===Step 2: Extract only the mean and std. dev. for each measurement ==========
#
# In order to know which values have mean and standard deviation, the best way to
# proceed is to name the columns correctly, given that we already have a file
# named features.txt with descriptive names for the measurements.  We will read
# this file and create a list of 563 correct names for the columns, then we will
# use only the ones with a name that matches either 'mean' or 'std'
#
# =============================================================================

features_table <- read.table(".//UCI HAR Dataset//features.txt", col.names = c("id", "measures"))
  
#  names(merged_sets) <- c("subject", "activity", as.character(features_table$measures))
#rm("features_table")
