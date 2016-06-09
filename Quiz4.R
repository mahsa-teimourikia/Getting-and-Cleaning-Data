#'The American Community Survey distributes downloadable data about United States communities.
#' Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
#' https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
#' and load the data into R. The code book, describing the variable names is here:
#' https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
#' Apply strsplit() to split all the names of the data frame on the characters "wgtp". 
#' What is the value of the 123 element of the resulting list?
#' 

if(!file.exists("./data")){dir.create("./data")}

fileUrl="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl ,destfile = "./data/housing.csv")
housingData <- read.csv("./data/housing.csv")

head(housingData)

housingNames <- names(housingData)
housingNames

splitNames <- strsplit(housingNames, "wgtp")
splitNames[[123]]

#' Load the Gross Domestic Product data for the 190 ranked countries in this data set:
#' https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
#' Remove the commas from the GDP numbers in millions of dollars and average them. What is the average?
#' Original data sources:
#' http://data.worldbank.org/data-catalog/GDP-ranking-table

if(!file.exists("./data")){dir.create("./data")}

fileUrl2="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl2 ,destfile = "./data/gdp.csv")
GDPData <- read.csv("./data/gdp.csv", header = FALSE, skip = 5, nrows = 190)

# Cleaning
drops <- c("V3", "V7", "V8","V9", "V10")
GDPClean <- GDPData[, !(names(GDPData) %in% drops)]

# Setting column names
names(GDPClean)<- c("CountryCode", "Rank", "CountryName", "GDP", "UnKnown")

GDPClean$GDP<-gsub(",","",GDPClean$GDP)

mean(as.numeric(GDPClean$GDP))


#' In the data set from Question 2 what is a regular expression that would allow you to count 
#' the number of countries whose name begins with "United"? Assume that the variable with the 
#' country names in it is named countryNames. How many countries begin with United? 

countUnited <- grep("^United", GDPClean$CountryName)
countUnited
length(countUnited)

#' Load the Gross Domestic Product data for the 190 ranked countries in this data set:
#' https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
#' Load the educational data from this data set:
#'  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv
#'  Match the data based on the country shortcode. Of the countries for which the end of the fiscal year 
#'  is available, how many end in June?
#'  Original data sources:
#'  http://data.worldbank.org/data-catalog/GDP-ranking-table
#'  http://data.worldbank.org/data-catalog/ed-stats

if(!file.exists("./data")){dir.create("./data")}

fileUrl2="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileUrl3 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl2 ,destfile = "./data/gdp.csv")
download.file(fileUrl3, destfile = "./data/statscountry.csv")
GDPData <- read.csv("./data/gdp.csv", header = FALSE, skip = 5, nrows = 190)
StatsCountryData <- read.csv("./data/statscountry.csv")

# Cleaning
drops <- c("V3", "V7", "V8","V9", "V10")
GDPClean <- GDPData[, !(names(GDPData) %in% drops)]

# Setting column names
names(GDPClean)<- c("CountryCode", "Rank", "CountryName", "GDP", "UnKnown")

MergedData <- merge(GDPClean, StatsCountryData, all=TRUE, by=c("CountryCode"))

# One way
isFiscalYearEnd <- grepl("fiscal year end", tolower(MergedData$Special.Notes))
isJune <- grepl("june", tolower(MergedData$Special.Notes))
table(isFiscalYearEnd,isJune)

# Another Way
fiscalYearEndInJune <- grep("[Ff]iscal [Yy]ear [Ee]nd(.*)[Jj]une", MergedData$Special.Notes)
fiscalYearEndInJune
length(fiscalYearEndInJune)

#'You can use the quantmod (http://www.quantmod.com/) package to get historical stock prices for publicly 
#'traded companies on the NASDAQ and NYSE. Use the following code to download data on Amazon's stock price 
#'and get the times the data was sampled.
#'library(quantmod)
#'amzn = getSymbols("AMZN",auto.assign=FALSE)
#'sampleTimes = index(amzn)
#'How many values were collected in 2012? How many values were collected on Mondays in 2012?

install.packages("quantmod")
library(quantmod)

amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

sampleYears <- year(sampleTimes)
sampleWeekDays <- weekdays(sampleTimes)

sampleYears2012 <- (sampleYears==2012)
sampleYears2012

sampleWeekDaysMonday <- (sampleWeekDays=="Monday")
sampleWeekDays

table(sampleYears2012, sampleWeekDaysMonday)
