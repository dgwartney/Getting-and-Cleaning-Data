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
download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml",xmlFile,method="curl")
doc <- xmlTreeParse(xmlFile,useInternal=TRUE)
rootNode <- xmlRoot(doc);
xmlName(rootNode)
