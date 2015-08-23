# Getting-and-Cleaning-Data
## run_analysis.R
The script does the following: <br />
Part 1 - Merges the training and the test sets to create one data set.<br />
Part 2 - Extracts only the measurements on the mean and standard deviation for each measurement. <br/>
Part 3 - Uses descriptive activity names to name the activities in the data set <br/>
Part 4 - Appropriately labels the data set with descriptive variable names. <br/>
Part 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. <br/>
Part 6 - Output the tidy data set into a new file named "tidyDataset.txt" <br/><br/>

#### Environment Setup before running the script
1) Set the R studio working directory <br/>
2) Download the dataset from the following link <br/>
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip <br/>
3) Unzip the files into a folder named "UCI HAR Dataset" and placed in the R studio working directory <br/>
4) Copy the run_analysis.R script into the same folder where the data files resided. <br/><br/>


#### Running the run_analysis.R script
source the script using the command <br/>
**source("run_analysis.R")**

You should see the following log message on screen if the script works:
```
 Getting and Cleaning Data Project 
 ================================= 
 Loading the library packages: data.table ...  
 Loading the library packages: dplyr ... 

 Reading the features.txt into a variable ... 
 Reading the training data ... 
 Reading the test data ... 

 PART 1 - Merges the training and the test sets to create one data set... 
          Naming column for datasets ... 
          Combine all dataset into one complete dataset ... 

 PART 2 - Extracts only the measurements on the mean and standard deviation for each measurement ... 

 PART 3 - Uses descriptive activity names to name the activities in the data set ... 

 PART 4 - Appropriately labels the data set with descriptive variable names ... 
          Search and replace the shortform with the fullname ... 

 PART 5 - From the data set in step 4, creates a second, independent tidy data set 
          with the average of each variable for each activity and each subject.... 

 Writing a tidy data set into tidyDataset.txt with write.table() using row.name=FALSE
```
The end result will be a file called **"tidyDataset.txt"** in the same folder. You may use the **list.files()** command to check the file.
<br/></br>


#### Final output file: tidyDataset.txt
Each row in the file contains subject, activity, and measures for all required features (i.e., mean or standard deviation).
