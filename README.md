## Getting-and-Cleaning-Data-Course-Project

The following files are included in this repo:
- 'README.md' : This file
- 'CodeBook.md' : A codebook describing the variables and values
- 'run_analysis.R' : The R script for run_analysis function

Working directory and data:
- The 'run_analysis.R'file should be stored and run in a working directory which contains 'features.txt' and 'activity_labels.txt'. The train and test data sets are stored in working_directory/train/ and working_directory/test/ 

Library:
- The run_analysis function starts by loading the DPLYR and TIDYR packages. For the most part the function utilizes base R functionalities with some DPLYR functions at the end

Section:
- The function can be broken down into three sections: Read and tidy train data set, Read and tidy test data set and Combine train and test data sets
- Read and tidy train data set: this section involves reading the train data set 
  - variables = features.txt
  - activity_labels = activity_labels.txt
  - x_train = /train/X_train.txt 
  - y_train = /train/y_train.txt
 - It continues by renaming the headers:
  - variables = variable_id and variable_name for 561 variables
  - activity_labels = activity_id and activity type for 6 activities
  - 


