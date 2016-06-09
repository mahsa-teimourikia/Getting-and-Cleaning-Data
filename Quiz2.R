## Quiz2

 setwd("C:/Users/Teimourikia/Desktop/Data Science/Getting and Cleaning Data/WorkingDir")
 
 #'Register an application with the Github API here https://github.com/settings/applications. 
 #'Access the API to get information on your instructors repositories (hint: this is the
 #' url you want "https://api.github.com/users/jtleek/repos"). Use this data to find the time
 #'  that the datasharing repo was created. What time was it created?
 
 #' This tutorial may be useful (https://github.com/hadley/httr/blob/master/demo/oauth2-github.r). 
 #' You may also need to run the code in the base R package and not R studio.

## installing the httr package
install.packages("httr")

## installing httpuv
install.packages("httpuv")

## installing jasonlite
install.packages("jsonlite")

## using the packages

library(httr)
require(httpuv)
require(jsonlite)

# 1. Find OAuth settings for github: http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications
# Insert your values below - if secret is omitted, it will look it up in the
# GITHUB_CONSUMER_SECRET environmental variable.  Use http://localhost:1410
# as the callback url
myapp <- oauth_app("quiz2", "f1c4097cf04b11024d4e", secret = "cf4059f9f2d733e1f1b0d4bdae789b25fba993b7")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
output <- content(req)
dsh_index <- which(sapply(output, FUN = function(X) "datasharing" %in% X))
list(output[[dsh_index]]$name, output[[dsh_index]]$created_at)


#' The sqldf package allows for execution of SQL commands on R data frames. 
#' We will use the sqldf package to practice the queries we might send with the dbSendQuery 
#' command in RMySQL. 
#' Download the American Community Survey data and load it into an R object called: acs
#' https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
#' 
#' Which of the following commands will select only the data for the probability
#'  weights pwgtp1 with ages less than 50?
#'  

install.packages("sqldf")
install.packages("data.table")
library(sqldf)
library(data.table)

## Downloading the data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
f <- file.path(getwd(), "Fss06pid.csv")
download.file(url,f)

## reading the file into a data frame
acs <- data.table(read.csv(f))

## Test the queries
query1 <- sqldf("select * from acs where AGEP < 50")
query2 <- sqldf("select pwgtp1 from acs")
query3 <- sqldf("select pwgtp1 from acs where AGEP < 50") ## This one!
query4 <- sqldf("select * from acs")

#' Using the same data frame you created in the previous problem,
#'  what is the equivalent function to unique(acs$AGEP)

res <- unique(acs$AGEP)
first <- sqldf("select distinct AGEP from acs")
second <- sqldf("select AGEP where unique from acs")
third <- sqldf("select unique * from acs")
forth <- sqldf("select distinct pwgtp1 from acs")


#' How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page:
#'http://biostat.jhsph.edu/~jleek/contact.html
#'(Hint: the nchar() function in R may be helpful)

con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)

c(nchar(htmlCode[10]), nchar(htmlCode[20]), nchar(htmlCode[30]), nchar(htmlCode[100]))

#'Read this data set into R and report the sum of the numbers in the fourth of the nine columns.
#'https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for
#'Original source of the data: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for
#'(Hint this is a fixed width file format)


library(foreign)
library(RCurl)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
f <- file.path(getwd(), "q2.xpt")
download.file(fileUrl, destfile = f)
data <- read.fwf(file= f,
                    skip=4,
                    widths=c(12, 7,4, 9,4, 9,4, 9,4))
sum(data[4]) +sum(data[9])

