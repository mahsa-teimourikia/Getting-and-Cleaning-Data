## Description of original files in the dataset
### Description of test and train datasets
- X_test and X_train datasets include the test and train feature data 
- y_test and y_train datasets include activity lables for the collected feature data
- subject_test and subject_train data sets include subject ids for the gathered data
### Other used files:
- features.txt includes feature names for the data that are included in X-test and X_train data sets
- activity_labels.txt includes the activity names:
      - Walking
      - Walking Upstairs
      - Walking Downstairs
      - Sitting
      - Standing
      - Laying

## Description of the transformations to clean the data
### run_analysis.R does the following:
  1. downloads required data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  2. unzips the file in the indicated path
  3. reads and merges the test and train data files
  4. loads features.txt as featurenames and subsets the features that include mean or std in their names
  5. subsets the merged X_test and X_train to extract the features related to mean and std
  6. reads activity names from activity_labels.txt, converts them to lower case and removes the "_"
  7. updates the values of merged y_test and y_train with the cleaned activity names from step 6
  8. sets descriptive names for the columns of the all datasets
  9. merge all datasets to create a unique data set
  10. Write the tidy and unique data set in the merged_data_set.txt
  11. Calculates the averages of features for each activity and each subject from the resulted dataset
  12. writes the averages results in average_data.txt
 
 ### Description of data on  merged_data_set.txt
 - columns 1 to 66 are the features related to mean and std values:
    - Time domain body acceleration mean along X, Y, and Z:
      - "tBodyAcc-mean()-X"           
      - "tBodyAcc-mean()-Y"           
      - "tBodyAcc-mean()-Z"  
    - Time domain body acceleration standard deviation along X, Y, and Z: 
      - "tBodyAcc-std()-X"            
      - "tBodyAcc-std()-Y"            
      - "tBodyAcc-std()-Z"   
    - Time domain gravity acceleration mean along X, Y, and Z: 
      - "tGravityAcc-mean()-X"        
      - "tGravityAcc-mean()-Y"        
      - "tGravityAcc-mean()-Z"   
    - Time domain gravity acceleration standard deviation along X, Y, and Z: 
      - "tGravityAcc-std()-X"         
      - "tGravityAcc-std()-Y"         
      - "tGravityAcc-std()-Z"     
    - Time domain body jerk mean along X, Y, and Z: 
      - "tBodyAccJerk-mean()-X"      
      - "tBodyAccJerk-mean()-Y"       
      - "tBodyAccJerk-mean()-Z"  
    - Time domain body jerk standard deviation along X, Y, and Z: 
      - "tBodyAccJerk-std()-X"        
      - "tBodyAccJerk-std()-Y"        
      - "tBodyAccJerk-std()-Z"   
    - Time domain gyroscope mean along X, Y, and Z: 
      - "tBodyGyro-mean()-X"          
      - "tBodyGyro-mean()-Y"          
      - "tBodyGyro-mean()-Z"    
    - Time domain gyroscope standard deviation along X, Y, and Z: 
      - "tBodyGyro-std()-X"           
      - "tBodyGyro-std()-Y"           
      - "tBodyGyro-std()-Z"       
    - Time domain gyroscope jerk mean along X, Y, and Z: 
      - "tBodyGyroJerk-mean()-X"      
      - "tBodyGyroJerk-mean()-Y"      
      - "tBodyGyroJerk-mean()-Z"   
    - Time domain gyroscope jerk standard deviation along X, Y, and Z: 
      - "tBodyGyroJerk-std()-X"       
      - "tBodyGyroJerk-std()-Y"       
      - "tBodyGyroJerk-std()-Z"   
    - Time domain body acceleration magnitude mean: 
      - "tBodyAccMag-mean()"  
    - Time domain body acceleration magnitude standard deviation: 
      - "tBodyAccMag-std()"  
    - Time domain gravity acceleration magnitude mean: 
      - "tGravityAccMag-mean()"  
    -Time domain gravity acceleration magnitude standard deviation:
      - "tGravityAccMag-std()"  
    - Time domain body jerk magnitude mean: 
      - "tBodyAccJerkMag-mean()"   
    - Time domain body jerk magnitude standard deviation: 
      - "tBodyAccJerkMag-std()"      
    - Time domain gyroscope magnitude mean: 
      - "tBodyGyroMag-mean()"         
    - Time domain gyroscope magnitude standard deviation: 
      - "tBodyGyroMag-std()"     
    - Time domain gyroscope jerk magnitude mean: 
      - "tBodyGyroJerkMag-mean()"    
    - Time domain gyroscope jerk magnitude standard deviation: 
      - "tBodyGyroJerkMag-std()"  
    - Frequency domain body acceleration mean along X, Y, and Z: 
      - "fBodyAcc-mean()-X"           
      - "fBodyAcc-mean()-Y"          
      - "fBodyAcc-mean()-Z" 
    - Frequency domain body acceleration standard deviation along X, Y, and Z: 
      - "fBodyAcc-std()-X"            
      - "fBodyAcc-std()-Y"           
      - "fBodyAcc-std()-Z"  
    - Frequency domain body jerk mean along X, Y, and Z: 
    - "fBodyAccJerk-mean()-X"       
    - "fBodyAccJerk-mean()-Y"      
    - "fBodyAccJerk-mean()-Z"      
    - Frequency domain body jerk standard deviation along X, Y, and Z: 
    - "fBodyAccJerk-std()-X"       
    - "fBodyAccJerk-std()-Y"       
    - "fBodyAccJerk-std()-Z"  
    - Frequency domain gyroscope mean along X, Y, and Z: 
      - "fBodyGyro-mean()-X"          
      - "fBodyGyro-mean()-Y"         
      - "fBodyGyro-mean()-Z" 
    - Frequency domain gyroscope standard deviation along X, Y, and Z: 
      - "fBodyGyro-std()-X"           
      - "fBodyGyro-std()-Y"          
      - "fBodyGyro-std()-Z"    
    - Frequency domain body acceleration magnitude mean: 
      - "fBodyAccMag-mean()"       
    - Frequency domain body acceleration magnitude standard deviation: 
      - "fBodyAccMag-std()"          
    - Frequency domain body jerk magnitude mean: 
      - "fBodyBodyAccJerkMag-mean()"  
    - Frequency domain body jerk magnitude standard deviation: 
      - "fBodyBodyAccJerkMag-std()"   
    - Frequency domain gyroscope magnitude mean: 
      - "fBodyBodyGyroMag-mean()"  
    - Frequency domain gyroscope magnitude standard deviation: 
      - "fBodyBodyGyroMag-std()"      
    - Frequency domain gyroscope jerk magnitude mean: 
      - "fBodyBodyGyroJerkMag-mean()" 
    - Frequency domain gyroscope jerk magnitude standard deviation: 
      - "fBodyBodyGyroJerkMag-std()" 
 - column 67 is the activity data
 - column 68 includes the subject ids

### Description of the average_data.txt
-
