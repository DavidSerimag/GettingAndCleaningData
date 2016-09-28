# Read tables
trainS <- read.table("train/subject_train.txt")
trainX <- read.table("train/X_train.txt")
trainY <- read.table("train/y_train.txt")
testS <- read.table("test/subject_test.txt")
testX <- read.table("test/X_test.txt")
testY <- read.table("test/y_test.txt")

# Join training and test data
joinS <- rbind(trainS,testS)
joinY <- rbind(trainY,testY)
joinX <- rbind(trainX,testX)

# Read other tables
feat <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

# Find means and std deviations in the features. Then, subset them in the same object
myFeat <- grep("-(mean|std)\\(\\)", feat[, 2])
joinX <- joinX[, myFeat]

# Substitute the activities IDs by their names
joinY[, 1] <- activities[joinY[, 1], 2]

# Rename the name of the columns
names(joinS) <- "Subject"
names(joinY) <- "Activity"
names(joinX) <- feat[myFeat, 2]

# Merge all data in one data set
myDF <- cbind(joinS,joinY,joinX)

# Using plyr, calcute the mean of each column for each concept
library(plyr)
myAvg <- ddply(myDF, .(Subject, Activity), function(x) colMeans(x[, 3:68]))

# Write the data into a file
write.table(myAvg, "myAvg.txt")