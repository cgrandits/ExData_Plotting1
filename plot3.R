############################ 1. GET THE DATA #################################
# read the full data set
#fulldata = read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# first get only the period of interest: Feb 1 & 2, 2007
# (a little grepping around was necessary to see that it was not "01/02/2007")
#poi = fulldata[fulldata$Date=="1/2/2007" | fulldata$Date=="2/2/2007",]

############################ 2. CREATE INDEPENDENT VARIABLE####################

#consolidate Date and Time into a POSIXlt class variable 
poi$datetime = strptime(paste(poi$Date,poi$Time),format='%d/%m/%Y %H:%M:%S')

############################ 3. PLOT ##########################################
png("plot3.png",width=480, height=480)

#plot3 
sm_labels = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
sm_colors = c("black", "red", "blue")
with(poi, {
    # in initial plot y varaible a is dummy since type is none
    plot(datetime, Sub_metering_1,  xlab="", ylab="Energy sub metering", type="n" )
    lines(datetime, Sub_metering_1, type='l', col=sm_colors[1])
    lines(datetime, Sub_metering_2, type="l", col=sm_colors[2])
    lines(datetime, Sub_metering_3, type="l", col=sm_colors[3])
    legend("topright", sm_labels, lty=c(1,1,1), col=sm_colors)
})

dev.off()
