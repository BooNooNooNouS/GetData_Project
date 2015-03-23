
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

# ===Step 4: Appropriately label the data set with descriptive variable names ==
#
# In preparation for this we need to have descriptive names for the columns in
# the tidy table we will have.  we know we want to use columns "subject", "activity",
# and all of the columns as described on features.txt for which we need to
# gather these column names to do a proper binding when the time comes.
#
# The document features.txt has 2 columns, the first one is nothing but a row
# number or index, the second one is the actual name for that feature, which is
# the only one we are interested in, so we take the table and get only the second
# column.
# =============================================================================
measurement_names <- read.table(".//UCI HAR Dataset//features.txt", 
                                stringsAsFactors = FALSE)[,2]
print(
  sprintf("DBG: measurement_names calculated with dimensions: [%s]", 
          length(measurement_names)))


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
  bind_cols (read.table(".//UCI HAR Dataset//train//x_train.txt", col.names = measurement_names)) %>%
  tbl_df

print(
  sprintf("DBG: merged_train calculated with dimensions: [%s, %s]", 
          dim(merged_train)[1], 
          dim(merged_train)[2]))

merged_test  <- read.table(".//UCI HAR Dataset//test//subject_test.txt", col.names = c("subject")) %>% 
  bind_cols (read.table(".//UCI HAR Dataset//test//y_test.txt", col.names = c("activity"))) %>%
  bind_cols (read.table(".//UCI HAR Dataset//test//x_test.txt", col.names = measurement_names)) %>%
  tbl_df

print(
  sprintf("DBG: merged_test calculated with dimensions: [%s, %s]", 
          dim(merged_test)[1], 
          dim(merged_test)[2]))

merged_sets <- bind_rows(merged_train, merged_test)
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

rm("measurement_names") #cleanup variables that we won't be using anymore
merged_sets <- merged_sets %>%
  select(subject, activity, contains("mean"), contains("std"))
print(
  sprintf("DBG: merged_sets with only mean and std with dimensions: [%s, %s]", 
          dim(merged_sets)[1], 
          dim(merged_sets)[2]))


# ===Step 3: Use descriptive activity names in the data set ===================
#
# The activity column has numbers 1-6 that map to the different activities that
# were performed.  There is a file activity_labels.txt that has the mapping of
# number to description.  We need to create a reference table by reading the txt
# file
# In this file there's a table with 2 columns, the first one is an index and the
# second one is the corresponding string for that index.
#
# =============================================================================

activities <- read.table(".//UCI HAR Dataset//activity_labels.txt", 
                         stringsAsFactors = FALSE,
                         col.names = c("value", "name"))

# helper function to find the name corresponding to the activity
findVerboseActivity<-function(theList) {
  result = c()
  for(currValue in theList)
    result <- c(result, activities[activities$value == currValue,"name"])
  unlist(result)
}

merged_sets <- merged_sets %>%
  mutate(activity = findVerboseActivity(activity))
rm("activities") # data cleanup

print(
  sprintf("DBG: merged_sets with descriptive activity names: [%s, %s]", 
          dim(merged_sets)[1], 
          dim(merged_sets)[2]))

# === Step 5: From the data set in step 4, create a second tidy dataset with ==
# === the average of each variable for each activity and each subject. ========

averaged_set <- merged_sets %>%
  group_by(activity, subject) %>%
  summarise_each(funs(mean))
print(
  sprintf("DBG: averaged_set with dimensions: [%s, %s]", 
          dim(averaged_set)[1], 
          dim(averaged_set)[2]))