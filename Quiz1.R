if(!file.exists("data")) {
        dir.create("./data")
}

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

library(RCurl)


# download the file from internet
download.file(fileUrl, destfile = "./data/housing.csv", method = "libcurl")

# read the csv file
housingData <- read.csv("./data/housing.csv")

# Convert to data table
housingDT <- data.table(housingData, rownames=TRUE)

# count properties that are worth $1,000,000 or more
valmoremillion <- housingDT[, .N, by=VAL]

# reading an excel file

excelFileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(excelFileUrl, "./data/gas.xlsx", mode = "wb")
dateDownloaded <- date()

library(xlsx)
rowIndex <- 18:23
colIndex <- 7:15
dat <- read.xlsx("./data/gas.xlsx", sheetIndex = 1, rowIndex = rowIndex, colIndex = colIndex, header = TRUE) 

sum(dat$Zip * dat$Ext, na.rm=T)

# Reading the XML file
library(XML)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileURL, destfile=tf <- tempfile(fileext=".xml"))
doc <- xmlParse(tf)
zip <- xpathSApply(doc, "/response/row/row/zipcode", xmlValue)
sum(zip == "21231")

# fread()

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, "./data/housingIdaho")

library(data.table)
DT <- fread("./data/housingIdaho")

system.time(replicate(1000,sapply(split(DT$pwgtp15,DT$SEX),mean)))
system.time(replicate(1000,{mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)}))
system.time(replicate(1000,tapply(DT$pwgtp15,DT$SEX,mean)))
system.time(replicate(1000,DT[,mean(pwgtp15),by=SEX]))
system.time(replicate(1000,mean(DT$pwgtp15,by=DT$SEX)))
system.time(replicate(1000,{rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]}))