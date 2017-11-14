run_analysis <- function() {
          library(dplyr)
          library(tidyr)
          
          ## Section 1: Read and tidy train data set
          variables <- read.table("features.txt", header = F) ## table of 561 variable names and ids
          activity_labels <- read.table("activity_labels.txt", header = F) ## table of 6 activity types and ids
          x_train <- read.table("./train/X_train.txt", header = F) ## table of 7352 observations of 561 variables
          y_train <- read.table("./train/y_train.txt", header = F) ## table of activity ids for 7352 observations
          subject_train <- read.table("./train/subject_train.txt", header = F) ## table of subject ids for 7352 observations
          
          names(variables) <- c("variable_id","variable_name") ## rename headers to variable_id and variable_names
          names(activity_labels) <- c("activity_id","activity_type") ##  headers to activity_id, activity_type
          names(subject_train) <- "subject_id" ## rename header to subject_id
          names(y_train) <- "activity_id" ## rename header to activity_id
          names(x_train) <- variables$variable_name ## rename headers according to variable_name
          
          selected_variables <- grep("mean()|std()", variables$variable_name) ## identify variable ids with mean() or std()
          x_train_selected <- x_train[ , selected_variables] ## subset data frame based on selected 79 variables with mean or std
          x_train_merged <- cbind(x_train_selected, y_train, subject_train) ## bind variables for all observations with activity id and subject_id

          ## Section 2: Read and tidy test data set
          x_test <- read.table("./test/X_test.txt", header = F) ## table of 2947 observations of 561 variables
          y_test <- read.table("./test/y_test.txt", header = F) ## table of activity ids for 2947 observations
          subject_test <- read.table("./test/subject_test.txt", header = F) ## table of subject ids for 2947 observations
          
          names(subject_test) <- "subject_id" ## rename header to subject_id
          names(y_test) <- "activity_id" ## rename header to activity_id
          names(x_test) <- variables$variable_name ## rename headers according to variable_name

          x_test_selected <- x_test[ , selected_variables] ## subset data frame based on selected 79 variables with mean or std
          x_test_merged <- cbind(x_test_selected, y_test, subject_test) ## bind variables for all observations with activity id and subject_id

          ## Section 3: Combine rows of train and test data sets
          all_data <- rbind(x_train_merged, x_test_merged)  ## bind x_train and x_test by row
          all_data_merged <- merge(all_data, activity_labels, by="activity_id" ) ## merge with activity_labels to get activity types
          all_data_gathered <- gather(all_data_merged, "measure", "value", 2:80) ## gather all variables under measure column
          all_data_gathered <- select(all_data_gathered, subject_id:value) ## select all columns except activity_id
       
          return(all_data_gathered) ## display result of tidy data
}


