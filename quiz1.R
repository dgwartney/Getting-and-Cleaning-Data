file1 = "ssh06hid.csv"
download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile=file1,method="curl")
download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf",destfile="PUMSDataDic06.pdf",method="curl")

data1 = read.table(file1,sep=",",header=TRUE)

data2 <- subset(data1,data1$VAL == 24)
nrow(data2)


excelFile <-"FDATA.gov_NGAP.xlsx"
download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx",destfile=excelFile,method="curl")

library(xlsx)
dat <- read.xlsx("FDATA.gov_NGAP.xlsx",sheetName="NGAP Sample Data",startRow=18,endRow=23,colIndex=c(7:15))
sum(dat$Zip*dat$Ext,na.rm=T)

library(XML)
xmlFile <- "restaurants.xml"
download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml",destfile=xmlFile,method="curl")
doc <- xmlTreeParse(xmlFile,useInternal=TRUE)
rootNode <- xmlRoot(doc);
xmlName(rootNode)
rows <- xpathSApply(rootNode,"//zipcode",xmlValue)
class(rows)
length(rows[rows == 21231])

library(data.table)
csvFile="ss06pid.csv"
download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",destfile=csvFile,method="curl")
DT <- fread(csvFile)

print("*** first ***")
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
print("*** second ***")
system.time(mean(DT[DT$SEX==1,]$pwgtp15))
system.time(mean(DT[DT$SEX==2,]$pwgtp15))
print("*** third ***")
system.time(DT[,mean(pwgtp15),by=SEX])
print("*** four ***")
system.time(rowMeans(DT)[DT$SEX==1])
system.time(rowMeans(DT)[DT$SEX==2])
print("*** Five ***")
system.time(mean(DT$pwgtp15,by=DT$SEX))
print("*** Six ***")
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))





