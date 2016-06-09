# The purpose of this project is to  collect, work with, and clean a data set, on the data collected from 
# data collected from the accelerometers of the Samsung Galaxy S smartphone, to:
#1) Merges the training and the test sets to create one data set.
#2) Extracts only the measurements on the mean and standard deviation for each measurement. 
#3) Uses descriptive activity names to name the activities in the data set
#4) Appropriately labels the data set with descriptive variable names. 
#5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


#' @description  A function for Downloading and unzipping the datasets
#' @param fUrl: the zip file URL
readUnzipFiles <- function(fUrl){
        # Creating a directory to contain the data
        if(!file.exists("./data")){dir.create("./data")}
        
        # Downloading the zip file
        zipData <- download.file(fileUrl, destfile = "./data/dataset.zip")
        
        # Unzipping the file
        unzip(zipfile = "./data/dataset.zip", exdir = "./data")
}


#' @description  a fuction to create the path to data files
#' @param ... parts of file paths to be pasted together
createFilePath <- function(...){
        paste(..., sep = "/")
}

#' @description  a function to read txt files
#' @param pathToData: the local path to the txt file
readData <- function(pathToData){
        unzipDir = "./data/UCI HAR Dataset"
        data <- data.frame()
        data <- read.table(createFilePath(unzipDir, pathToData),sep="",stringsAsFactors=F)
       
        data
}

#' @description a function for reading and merging test and train files
#' @param testFile: path to test file
#' @param trainFile: path to train file
readAndMerge <- function(testFile, trainFile){
        # Reading train and test data to cache
        train <- readData(trainFile)
        test <- readData(testFile)
        
        # merging x_train and x_test data
        merged <- rbind(train, test)
        
        merged
}

#' @description a function to column bind the final datasets
#' @param ... dataframes to be column bind
createFinalDataset <-  function(...) {
        finalSet<- cbind(...)
        finalSet
}

# Seting the url to data and downlowding the dataset
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
readUnzipFiles(fileUrl)


#########################################################################
#### 1) Merges the training and the test sets to create one data set.####
#########################################################################

# Reading and merging x_test and x_train data
xDataMerged <- readAndMerge("test/X_test.txt", "train/X_train.txt")

# Reading and merging y_test and y_train data
yDataMerged <- readAndMerge("test/y_test.txt", "train/y_train.txt")

# Reading and merging subject_test and subject_train data
subjectDataMerged <- readAndMerge("test/subject_test.txt", "train/subject_train.txt")


###################################################################################################
#### 2) Extracts only the measurements on the mean and standard deviation for each measurement. ###
###################################################################################################

# Reading the features data
featureNames <- readData("features.txt")

# getting the columns with mean() or std() in their names
meanAndSDFeatures <- grep("-(mean|std)\\(\\)", featureNames$V2)

# subsetting the columns we are interested in
xDataMeanSD <- xDataMerged[, meanAndSDFeatures]

###################################################################################
#### 3) Uses descriptive activity names to name the activities in the data set ####
###################################################################################

# reading and cleaning activity names
activityNames <- readData("activity_labels.txt")
activityNames$V2 <- gsub("_", "", tolower(as.character(activityNames$V2)))

# updating values with correct activity names
yDataMerged$V1 <- activityNames[yDataMerged$V1, 2]


###############################################################################
#### 4) Appropriately labels the data set with descriptive variable names. ####
###############################################################################
# add descriptive names to columns to x_data
names(xDataMeanSD) <- featureNames[meanAndSDFeatures, 2]

# Setting the descriptive column name for y_data
names(yDataMerged) <- "activity"

# setting a descriptive column name for subject_data
names(subjectDataMerged) <- "subject"

# Now column binding all data sets to get a unique set
finalSet <- createFinalDataset(xDataMeanSD, yDataMerged, subjectDataMerged)

# Writing the dataset into a new file
write.table(finalSet, "./data/merged_data_set.txt")

#########################################################################################
#### 5) Creates a second, independent tidy data set with the average of each variable#### 
#### for each activity and each subject.                                             ####
#########################################################################################

