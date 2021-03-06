##    PLOT 4
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

# PLOT 4
png(filename="plot4.png",bg="white")
par(mfrow = c(2, 2), mar = c(5, 4, 2, 1)) 

# Plot 4-1
plot(x=subsetdata$Date, y=subsetdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#Plot 4-2
plot(x=subsetdata$Date, y=subsetdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

#Plot 4-3 
plot(x=subsetdata$Date, y=subsetdata$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(x=subsetdata$Date, y=subsetdata$Sub_metering_2, type="l", col="red")
lines(x=subsetdata$Date, y=subsetdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#Plot 4-4 
plot(x=subsetdata$Date, y=subsetdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off()
