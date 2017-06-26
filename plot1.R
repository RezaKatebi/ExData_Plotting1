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

# Now let's make the histogram for Global Active Power and save in plot1.png

png("plot1.png", height = 480, width = 480)

hist(InterestData$Global_active_power, col = "red", main = "Global Active Power"
     , xlab = "Global Active Power (kilowatts)")
dev.off()

