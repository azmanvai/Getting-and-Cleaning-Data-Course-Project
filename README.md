## Getting-and-Cleaning-Data-Course-Project

The following files are included in this repo:
- 'README.md' : This file
- 'CodeBook.md' : A codebook describing the variables and values
- 'run_analysis.R' : The R script for run_analysis function
- 

Working directory and data:
- The 'run_analysis.R' file should be stored and run in a working directory which contains 'features.txt' and 'activity_labels.txt'. The train and test data sets are stored in working_directory/train/ and working_directory/test/ 

Library:
- The run_analysis function starts by loading the DPLYR and TIDYR packages. For the most part the function utilizes base R functionalities with some DPLYR functions at the end

run_analysis function:
- The function can be broken down into three sections: Read and tidy train data set, Read and tidy test data set and Combine train and test data sets
- Section1: Read and tidy train data set
  - Reading and assigning the train data sets
    - variables: data set from features.txt containing 561 variable names
    - activity_labels: data set from activity_labels.txt containing 6 activities
    - subject_train: data from /train/subject_train.txt containing subject ids for 7352 observations
    - x_train: data from /train/X_train.txt containing 7352 observations of 561 variables
    - y_train: data from /train/y_train.txt containing activity ids for 7352 observations
  - Renaming the headers
    - variables: variable_id and variable_name for 561 variables
    - ativity_labels: activity_id and activity type for 6 activities 
    - subject_train: subject_id for 7352 observations
    - y_train: activity_id for 7352 observations
    - x_train: rename 561 headers as per variable_name
  - Selecting variables and binding the train data sets
    - identify the 79 variables associated with mean() and std() and assign them to selected_variables 
    - subset x_train as per selected_variables and assign them to x_train_selected
    - combine x_train_selected, y_train and subject_train and assign them to x_train_merged  
- Section 2: Read and tidy test data sets
  - Reading and assigning the test data sets
    - subject_test: data from /test/subject_test.txt containing subject ids for 7352 observations
    - x_test: data from /test/X_test.txt containing 7352 observations of 561 variables
    - y_test: data from /test/y_test.txt containing activity ids for 7352 observations
  - Renaming the headers
    - subject_test: subject_id for 2947 observations
    - y_test: activity_id for 2947 observations
    - x_test: rename 561 headers as per variable_name
  - Selecting variables and binding the train data sets
    - subset x_test as per selected_variables and assign them to x_test_selected
    - combine x_test_selected, y_test and subject_test and assign them to x_test_merged    
- Section 3: Combine rows of train and test data sets
    - Row bind x_train_merged and x_test_merged and assign to all_data
    - Merge all_data and activity_labels to get descriptive names of activities and assign to all_data_merged
    - Gather all columns as per selected_variables under new columns measure and value, and assign to all_data_gathered
    - Select measure, subject_id, activity_type and value from all_data_gathered
    - display all_data_gathered
    
    
