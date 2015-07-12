############################ 1. GET THE DATA #################################
# read the full data set
fulldata = read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# first get only the period of interest: Feb 1 & 2, 2007
# (a little grepping around was necessary to see that it was not "01/02/2007")
poi = fulldata[fulldata$Date=="1/2/2007" | fulldata$Date=="2/2/2007",]

############################ 2. CREATE INDEPENDENT VARIABLE####################

#consolidate Date and Time into a POSIXlt class variable 
poi$datetime = strptime(paste(poi$Date,poi$Time),format='%d/%m/%Y %H:%M:%S')

############################ 3. PLOT ##########################################
png("plot2.png",width=480, height=480)

#plot2
with(poi, plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

dev.off()

