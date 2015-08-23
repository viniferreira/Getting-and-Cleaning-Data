# Code Book
#### Raw dataset
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

###### Attribute Information:
For each record in the dataset it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment.
* See Readme file into 'UCI HAR Dataset' for more information.

#### Tidy dataset
The tidy dataset contains
* an identifier of the subject who carried out the experiment **(Subject)**. Its range from 1 to 30.
* an activity label **(Activity)**: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* mean **(Mean)** and standard deviation **(Std)** of all other variables are measurement collected from the accelerometer and gyroscope 3-axial raw signal.

The original variable names in the raw data set were modified with the more descriptive way as below:
* Replaced Acc with Accelerometer
* Replaced Gyro with Gyroscope
* Replaced BodyBody with Body
* Replaced -mean with Mean
* Replaced -std with Std
* Replaced t with Time
* Replaced f with Frequency
* Removed parenthesis -()

###### Please refer below for the sample of renamed variables according to their original variable name
|Raw Data|Tidy Data|
|--------|---------|
|tBodyAcc-mean()-X|TimeBodyAccelerometerMeanX|
|tBodyAcc-std()|TimeBodyAccelerometerStdX|
|tGravityAcc-mean()-Y|TimeGravityAccelerometerMeanY|
|fBodyAcc-mean()-Z|FrequencyBodyAccelerometerMeanZ|
|fBodyBodyGyroJerkMag-std()|FrequencyBodyGyroscopeJerkMagStd|
