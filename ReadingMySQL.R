# Loading libraries

library(DBI)
library(RMySQL)
###################################
# Connecting and Listing databases#
###################################
ucscDb <- dbConnect(MySQL(), user="genome", host="genome-mysql.cse.ucsc.edu")

# All the available databases
result <- dbGetQuery(ucscDb, "Show databases;")

dbDisconnect(ucscDb)

###########################################
# Connecting to hg19 DB and listing tables#
###########################################
hg19 <-dbConnect(MySQL(), user="genome", db="hg19", host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)

allTables[1:5]

######################################
# Get dimmentions of a specific table#
######################################

dbListFields(hg19, "affyU133Plus2")
dbGetQuery(hg19, "select count(*) from affyU133Plus2")

# Read from the table

affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)

######################################
# Select a specifc subset of the data#
######################################

query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
# To fetch the results of the query
affyMis <- fetch(query)
# quantiles of the mismatches
quantile(affyMis$misMatches)

# You can only fetch the top 10 records
affyMisSmall <- fetch(query, n=10)

# You need to clear the query from the remote server
dbClearResult(query)

# dimention of the data frame
dim(affyMisSmall)

# Alway close the connection
dbDisconnect(hg19)

