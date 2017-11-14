# Getting-and-Cleaning-Data-Course-Project

The following files are included in this repo:
- 'README.md' : This file
- 'CodeBook.md' : A codebook describing the variables and values
- 'run_analysis.R' : The R script for run_analysis function

run_analysis function:
- The 'run_analysis.R'file should be stored and run in a working directory which contains 'features.txt', 'activity_labels.txt', 'train' and 'test' folders. The function starts by loading the DPLYR and TIDYR packages. 
can be broken down into three sections: Read and tidy train data set, Read and tidy test data set
and Combine train and test data sets
- Read and tidy train data set: in this section, it will first read 'features.txt' and 'activity_labels.txt'
in the working directory and store them as 'variables' and 'activity_labels'. Then it will read 'X_train.txt' and 'y_train.txt'
from the 'train' subfolder and store them as 'x_train' and'y_train'. The next 


