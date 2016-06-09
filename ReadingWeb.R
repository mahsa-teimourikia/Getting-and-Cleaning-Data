## Scraping data from websites

## using readLines will result in unformatted data, one line of all HTML
con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&HI=en")
htmlCode = readLines(con)
close(con)
htmlCode


## To resolve the problem of unformatted data we can use XML library
library(XML)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&HI=en"
html <- htmlTreeParse(url, useInternalNodes = TRUE)

## Getting the title of the page
xpathApply(html, "//title", xmlValue)

## See the paper citations
xpathSApply(html, "//td[@class='gsc_a_c']", xmlValue)


## GET from the httr package
## install.packages("httr")
library(httr)
html2 = GET(url)
content2 = content(html2, as="text")
parsedHTML = htmlParse(content2, asText = TRUE)
xpathSApply(parsedHTML, "//title", xmlValue)

## Accessing websites with passwords
pg1 = GET("http://httpbin.org/basic-auth/user/passwd")
pg1

## here we get an error

## to resolve this problem using httr package we can authenticate ourselves
pg2 = GET("http://httpbin.org/basic-auth/user/passwd", 
          authenticate("user","passwd"))
pg2

names(pg2)

## Using handles
google = handle("http://google.com")
pg1 = GET(handle = google, path="/")
pg2 = GET(handle = google, path="search")

