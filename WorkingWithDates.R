# Working with dates

d1 = date()
d1
# Date function produces dates as  characters
class(d1)

d2 =  Sys.Date()
d2
# The system date function produces date as date class
class(d2)


# Formatting dates
## %d = day as number (0-31)
## %a = abbreviated weekday
## %A = unabbreviated weekday
## %m = month(00-12)
## %b = abbreviated month
## %B = unabbreviated month
## %y = 2 digit year
## %Y = 4 digit year

format(d2, "%a %b %d")

# Creating dates

x = c("1jan1960", "2jan1960", "31mar1960", "30jul1960")
z = as.Date(x, "%d%b%Y")
z

# Time difference
z[1] - z[2]

as.numeric(z[1]-z[2])

# Converting to Julian: Getting number of days from 01-01-1970
weekdays(d2)

months(d2)

julian(d2)

# Using Lubridate package
install.packages("lubridate")
library(lubridate)

ymd("20140108")
mdy("08/04/2013")
dmy("03-04-2013")

# Dealing with time
ymd_hms("2011-08-03 10:15:03")

# Setting the time zone
ymd_hms("2011-08-03 10:15:03", tz ="Pacific/Auckland")

?Sys.timezone

# Some functions have slightly different syntax
x=dmy(c("1jan1960", "2jan1960", "31mar1960", "30jul1960"))
wday(x[1])

wday(x[1], label = TRUE)
