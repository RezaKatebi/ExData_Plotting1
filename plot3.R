# First we are going to read the Electric power consumption data

if(!file.exists("household_power_consumption.txt")){
        Url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(Url, destfile = "Electric.zip")
        unzip("Electric.zip", ".")
}

Electric <- read.table("household_power_consumption.txt", header = T, sep = ";"
                       , na.strings = "?")

# Let's choose the data with the dates between 2007-02-01 and 2007-02-02
InterestData <- Electric[Electric$Date %in% c("1/2/2007","2/2/2007"),]

# Now we are going to nake a new column with both date and time 
# combined and with a better format using strptime() function 

Date_Time <- strptime(paste(InterestData$Date, InterestData$Time, sep = " "),
                      format="%d/%m/%Y %H:%M:%S")
InterestData <- cbind(Date_Time, InterestData)

# Let's remove Date and Time columns now 

InterestData <- subset(InterestData, select = -c(Date, Time))

# Now let's make the plot and save it in plot3.png

png("plot3.png", height = 480, width = 480)

with(InterestData, plot(Date_Time, Sub_metering_1, type = "l",
                        ylab = "Energy sub metering", xlab = ""))
with(InterestData, lines(Date_Time, Sub_metering_2, col = "red"))
with(InterestData, lines(Date_Time, Sub_metering_3, col = "blue"))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , lty = 1 , lwd = 3, col = c("black", "red", "blue"))

dev.off()



