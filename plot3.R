if(!exists("./ElectricPower")){dir.create("./ElectricPower")}

urlData <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(urlData,destfile = "./ElectricPower/exdata_data_household_power_consumption.rar",method = "auto"); datedownload <- date()

dataFile <- "household_power_consumption.txt"

Electric <- read.table(dataFile,sep = ";", header = T, stringsAsFactors = F, dec = ".")

Electric <- Electric[Electric$Date %in% c("1/2/2007","2/2/2007"),]

setwd("C:/Users/Dell/Desktop/Bases de datos/ElectricPower")

##################################################################

dates <- strptime(paste(Electric$Date, Electric$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(Electric$Global_active_power)
subMetering1 <- as.numeric(Electric$Sub_metering_1)
subMetering2 <- as.numeric(Electric$Sub_metering_2)
subMetering3 <- as.numeric(Electric$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(dates, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dates, subMetering2, type="l", col="red")
lines(dates, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
