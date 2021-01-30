### Data
The data that should be used for this assignment represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for this assignment can be obtained here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

### Variables
- features: labels of variables used on the X_test and X_train dataframe
- activity_labels: links activity labels and activity IDs used on the y_test and y_train dataframe

Test data
- test.data: dataframe that consists of columns X_test, y_test and subject_test
  - X_test: test data set
  - y_test: activity IDs
  - subject_test: subject who performed the activity

Train data
- train.data: dataframe that consists of columns X_train, y_train and subject_train
  - X_train: train data set
  - y_train: activity IDs
  - subject_train: subject who performed the activity

all.data: consolidation of test.data and train.data


### Transformations to clean up data
- all.data_m_std: dataframe that consists only of mean and std variables as well as activity and subject id's from all.data

- all.data_m_std_tidy: dataframe that shows the mean of each variable by activity and by subject

