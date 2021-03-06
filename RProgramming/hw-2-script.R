#First task

library(httr)
library(httpuv)
library(jsonlite)

oauth_endpoints("github")

myapp <- oauth_app("github", "5d3f973735343b65d540", "1f2c08bb0b392cd4be380c49a904061427c3aeb8")

#Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

#Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
output <- content(req)

#Answer
list(output[[5]]$name, output[[5]]$created_at)


#Second task
library(sqldf)
library(data.table)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
f <- file.path(getwd(), "ss06pid.csv")
download.file(url, f)
acs <- data.table(read.csv(f))
query1 <- sqldf("select pwgtp1 from acs where AGEP < 50")
query2 <- sqldf("select pwgtp1 from acs")  ## NO
query3 <- sqldf("select * from acs where AGEP < 50 and pwgtp1")  ## NO
query4 <- sqldf("select * from acs where AGEP < 50")  ## NO


#Thitrd task
query1 <- sqldf("select distinct AGEP from acs")
query2 <- sqldf("select AGEP where unique from acs") ## NO
query3 <- sqldf("select unique * from acs") ## NO
query4 <- sqldf("select unique AGEP from acs") ## NO


#Fourth task
require(httr)
require(XML)

connection <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(connection)
close(connection)
c(nchar(htmlCode[10]), nchar(htmlCode[20]), nchar(htmlCode[30]), nchar(htmlCode[100]))

htmlCode <- GET("http://biostat.jhsph.edu/~jleek/contact.html")
content <- content(htmlCode, as = "text")
htmlParsed <- htmlParse(content, asText = TRUE)
xpathSApply(htmlParsed, "//title", xmlValue)


#Fifth task
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
lines <- readLines(url, n = 10)
w <- c(1, 9, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3)
colNames <- c("filler", "week", "filler", "sstNino12", "filler", "sstaNino12", 
              "filler", "sstNino3", "filler", "sstaNino3", "filler", "sstNino34", "filler", 
              "sstaNino34", "filler", "sstNino4", "filler", "sstaNino4")
d <- read.fwf(url, w, header = FALSE, skip = 4, col.names = colNames)
d <- d[, grep("^[^filler]", names(d))]
sum(d[, 4])