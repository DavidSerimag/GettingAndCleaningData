## Codebook

The code in run_analysis.R performs the actions:
* Read all files and store in tables
* Join test and train data for each file
* Subset the data with only the mean and standard deviations
* Change the values of the activities for its natural names
* Merge all data into one data set
* Calculates the means for each subject and each activity
* Writes it on a file

The variables used are:
* trainX, trainY, trainS: training data read for X, activities and subjects
* testX, testY, testS: test data read for X, activities and subjects
* joinX, joinY, joinS: joined data from tables read. JoinX will be replaced with the subset data
* myDF: merged data with all tables
* myAvg: table with the calculated means
