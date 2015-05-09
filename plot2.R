##    PLOT 2 


getwd()



# First calculate a rough estimate of how much memory the dataset will 
# require in memory before reading into R. Make sure your computer has 
# enough memory (most modern computers should be fine).
#### Size of object in MBs 
object.size ("D:/R/household_power_consumption.txt")/1048600 
#### RAM of computer in MB 
memory.size()


# read in the data

alldata <-read.table ("household_power_Consumption.txt", header=TRUE, sep= ";", na.strings="?")
str(alldata)
dim(alldata)


#### Subset
subsetdata <- subset(alldata, Date== "1/2/2007"| Date == "2/2/2007")
str (subsetdata)
head (subsetdata)
tail (subsetdata)


# You may find it useful to convert the Date and Time variables to Date/Time classes in 
# R using the strptime() and as.Date() functions.

subsetdata$Date <- as.Date(subsetdata$Date, format= "%d/%m/%Y")
str (subsetdata)
subsetdata$Date<- paste (subsetdata$Date, subsetdata$Time)
str (subsetdata)

subsetdata$Date <-strptime (subsetdata$Date, format = "%Y-%m-%d %H:%M:%S", tz="CST6CDT")

str(subsetdata)
head (subsetdata)
# PLOT 2 
png(filename="plot2.png",bg="white")
plot(x=subsetdata$Date, y=subsetdata$Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xlab="")
dev.off()
