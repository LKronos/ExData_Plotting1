##    PLOT  1 

getwd()


#### ggplot install and load
install.packages("ggplot2")
library(ggplot2)


# First calculate a rough estimate of how much memory the dataset will 
# require in memory before reading into R. Make sure your computer has 
# enough memory (most modern computers should be fine).
#### Size of object in MBs 
object.size ("D:/R/household_power_consumption.txt")/1048600 
#### RAM of computer in MB 
memory.size()


# read in the data

alldata <-read.table ("household_power_Consumption.txt", header=TRUE, sep= ";", na.strings="?")
head(alldata)
dim(alldata)


#### Subset
subsetdata <- subset(alldata, Date== "1/2/2007"| Date == "2/2/2007")


# You may find it useful to convert the Date and Time variables to Date/Time classes in 
# R using the strptime() and as.Date() functions.

subsetdata$Date <- as.Date(subsetdata$Date, format= "%d/%m/%Y")
subsetdata$Date<- paste (subsetdata$Date, subsetdata$Time)
subsetdata$Date <-strptime (subsetdata$Date, format = "%Y-%m-%d %H:%M:%S", tz="CST6CDT")

# PLOT 1 of  histogram  of  the global active power in kw. 
png(filename="plot1.png", bg="white")
hist(subsetdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)" )
dev.off()


