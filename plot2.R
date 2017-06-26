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

# Now let's make the plot and save it in plot2.png

png("plot2.png", height = 480, width = 480)

with(InterestData, plot(Date_Time, Global_active_power, type = "l",
                        ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()

