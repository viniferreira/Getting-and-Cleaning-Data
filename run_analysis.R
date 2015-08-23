cat("Getting and Cleaning Data Project","\n")
cat("=================================","\n")
cat("Loading the library packages: data.table ... ","\n")
cat("Loading the library packages: dplyr ...","\n")

library(data.table)
library(dplyr)

cat("Reading the features.txt into a variable ...","\n")
# Please ensure the dataset is downloaded and extracted into R home directory.
featuresName <- read.table("./UCI HAR Dataset/features.txt")

cat("Reading the training data ...","\n")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
featureTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
activityTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")

cat("Reading the test data ...","\n")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
featureTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
activityTest <- read.table("./UCI HAR Dataset/test/y_test.txt")

cat("\n")
cat("PART 1 - Merges the training and the test sets to create one data set...","\n")
mergedSubject <- rbind(subjectTrain, subjectTest)
mergedFeature <- rbind(featureTrain, featureTest)
mergedActivity <- rbind(activityTrain, activityTest)

cat("         Naming column for datasets ...","\n")
colnames(mergedFeature) <- featuresName$V2
colnames(mergedActivity) <- "Activity"
colnames(mergedSubject) <- "Subject"

cat("         Combine all dataset into one complete dataset ...","\n")
completeData <- cbind(mergedSubject, mergedFeature, mergedActivity)

cat("\n")
cat("PART 2 - Extracts only the measurements on the mean and standard deviation for each measurement ...","\n")
mean_col_idx <- grep("mean",names(completeData),ignore.case=TRUE)
std_col_idx <- grep("std",names(completeData),ignore.case=TRUE)
mean_colnames <- names(completeData)[mean_col_idx]
std_colnames <- names(completeData)[std_col_idx]
mean_std <- completeData[,c("Subject","Activity",mean_colnames,std_colnames)]

cat("\n")
cat("PART 3 - Uses descriptive activity names to name the activities in the data set ...","\n")
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, col.names=c('id', 'name'))
mean_std$Activity <- as.character(mean_std$Activity)
for (i in 1:6){
     mean_std$Activity[mean_std$Activity == i] <- as.character(activityLabels[i,2])
}

cat("\n")
cat("PART 4 - Appropriately labels the data set with descriptive variable names ...","\n")
cat("         Search and replace the shortform with the fullname ...","\n")
names(mean_std)<-gsub("Acc", "Accelerometer", names(mean_std))
names(mean_std)<-gsub("Gyro", "Gyroscope", names(mean_std))
names(mean_std)<-gsub("^t", "Time", names(mean_std))
names(mean_std)<-gsub("^f", "Frequency", names(mean_std))
names(mean_std)<-gsub("tBody", "TimeBody", names(mean_std))
names(mean_std)<-gsub("angle", "Angle", names(mean_std))
names(mean_std)<-gsub("gravity", "Gravity", names(mean_std))
names(mean_std)<-gsub("BodyBody", "Body", names(mean_std))
names(mean_std)<-gsub(".mean...X", "MeanX", names(mean_std))
names(mean_std)<-gsub(".mean...Y", "MeanY", names(mean_std))
names(mean_std)<-gsub(".mean...Z", "MeanZ", names(mean_std))
names(mean_std)<-gsub(".std...X", "StdX", names(mean_std))
names(mean_std)<-gsub(".std...Y", "StdX", names(mean_std))
names(mean_std)<-gsub(".std...Z", "StdX", names(mean_std))
names(mean_std)<-gsub(".std..", "Std", names(mean_std))
names(mean_std)<-gsub(".mean..", "Mean", names(mean_std))
names(mean_std)<-gsub(".meanFreq...X", "MeanFrequencyX", names(mean_std))
names(mean_std)<-gsub(".meanFreq...Y", "MeanFrequencyY", names(mean_std))
names(mean_std)<-gsub(".meanFreq...Z", "MeanFrequencyZ", names(mean_std))

cat("\n")
cat("PART 5 - From the data set in step 4, creates a second, independent tidy data set","\n")
cat("         with the average of each variable for each activity and each subject....","\n")
mean_std$Subject <- as.factor(mean_std$Subject)
mean_std <- data.table(mean_std)
tidyData <- aggregate(. ~Subject + Activity, mean_std, mean)
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]

cat("\n")
cat("Writing a tidy data set into tidyDataset.txt with write.table() using row.name=FALSE ")
write.table(tidyData, file = "tidyDataset.txt", row.names = FALSE)
