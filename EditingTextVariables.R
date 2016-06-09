#setwd("C:/Users/Teimourikia/Desktop/Data Science/Getting and Cleaning Data/WorkingDir")

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"

# download.file(fileUrl, destfile = "./data/cameras.csv", method = "curl") # Works on Mac OSx


download.file(fileUrl, destfile = "./data/cameras.csv") # This works fine on Windows
cameraData <- read.csv("./data/cameras.csv")
names(cameraData)


# Convering all names to lower case
tolower(names(cameraData))

# Fixing character vectors - strsplit()
## Good for spliting variable names
## important parametes: x, split

# split on .
splitNames <- strsplit(names(cameraData), "\\.")
splitNames[[5]]
splitNames[[6]]

# Fixing character vectors - sapply()
## Applies a function to each element in a vector or list
## important parameters: X, FUN

splitNames[[6]][1]
# To only get the first part of the variable name
firstElement <- function(x){x[1]}
sapply(splitNames, firstElement)


# Peer review data
fileUrl1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"

download.file(fileUrl1, destfile = "./data/reviews.csv")
download.file(fileUrl2, destfile = "./data/solutions.csv")

reviews <- read.csv("./data/reviews.csv")
solutions <- read.csv("./data/solutions.csv")

head(reviews, 2)

head(solutions, 2)

# Fixing character vectors - sub()
## important parameters: pattern, replacement, x

names(reviews)
sub("_","", names(reviews))

# Fixing character vectors- gsub()
testName <- "this_is_a_test"
# This only removes the first_
sub("_","",testName)
# This removes all _
gsub("_","",testName)

# Finding values - gerp(), grepl()

# find the index of all intersections that have "Alameda"
grep("Alameda", cameraData$intersection)

# returns true when Alameda appear and false otherwise
table(grepl("Alameda", cameraData$intersection))

# subsetting to data where Alameda does not exists
cameraData2 <- cameraData[!grepl("Alameda", cameraData$intersection),]

# To get the values instead of the indexes
grep("Alameda", cameraData$intersection, value = TRUE)

# If a value does not appear grep() returns integer(0)
grep("JeffStreet", cameraData$intersection)

# Therefore to check the existance of a value:
length(grep("JeffStreet", cameraData$intersection))


# Other useful string functions
install.packages("stringr")
library(stringr)

# Counting the characters
nchar("Jeffrey Leek")

# Getting the subset of characters between 2 indeces
substr("Jeffrey Leek", 1, 7)

# Pasting two strings together
paste("Jeffrey", "Leek")

# Pasting without separation
paste0("Mahsa", "Teimourikia")

# Triming spaces
str_trim("Mahsa     ")


