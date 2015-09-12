#Grab column labels from top row
collabs<-read.table("household_power_consumption.txt", nrows = 1, sep=";", colClasses = "character")
#Read in only the data from Feb 1 and Feb 2 2007
powerdata<- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep = ";", col.names = collabs[1,], colClasses = c("character", "character", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric"))
#Create new column of combined date and time variable
powerdata$datetime<- dmy_hms(paste(powerdata$Date, powerdata$Time))
#Open png device
png(filename = "plot2.png", width=480, height=480, units="px")
plot(powerdata$Global_active_power~powerdata$datetime, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(powerdata$datetime, powerdata$Global_active_power)
#Close png device
dev.off()