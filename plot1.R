############################ 1. GET THE DATA #################################
# read the full data set
fulldata = read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# first get only the period of interest: Feb 1 & 2, 2007
# (a little grepping around was necessary to see that it was not "01/02/2007")
poi = fulldata[fulldata$Date=="1/2/2007" | fulldata$Date=="2/2/2007",]

############################ 2. PLOT ##########################################
png("plot1.png",width=480, height=480)

#plot1
hist(poi$Global_active_power, col="darkorange2", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off();


