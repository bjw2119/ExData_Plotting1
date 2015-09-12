#Grab column labels from top row
collabs<-read.table("household_power_consumption.txt", nrows = 1, sep=";", colClasses = "character")
#Read in only the data from Feb 1 and Feb 2 2007
powerdata<- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep = ";", col.names = collabs[1,], colClasses = c("Date", "POSIXlt", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric"))
#Open png device
png(filename = "plot1.png", width=480, height=480, units="px")
hist(powerdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
#Close png device
dev.off()