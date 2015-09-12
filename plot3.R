#Grab column labels from top row
collabs<-read.table("household_power_consumption.txt", nrows = 1, sep=";", colClasses = "character")
#Read in only the data from Feb 1 and Feb 2 2007 (thanks to Chad Junkermeier for the piping example)
powerdata<- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep = ";", col.names = collabs[1,], colClasses = c("character", "character", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric"))
#Create new column of combined date and time variable
powerdata$datetime<- dmy_hms(paste(powerdata$Date, powerdata$Time))
#Open png device
png(filename = "plot3.png", width=480, height=480, units="px")
plot(powerdata$Sub_metering_1 ~powerdata$datetime, type="n", xlab="", ylab="Energy sub metering")
lines(powerdata$datetime, powerdata$Sub_metering_1)
lines(powerdata$datetime, powerdata$Sub_metering_2, col="red")
lines(powerdata$datetime, powerdata$Sub_metering_3, col="purple")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col = c("black", "red", "purple"))
#Close png device
dev.off()