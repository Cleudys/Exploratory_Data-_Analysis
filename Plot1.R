


if(!exists("./ElectricPower")){dir.create("./ElectricPower")}

urlData <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(urlData,destfile = "./ElectricPower/exdata_data_household_power_consumption.rar",method = "auto"); datedownload <- date()

dataFile <- "household_power_consumption.txt"

Electric <- read.table(dataFile,sep = ";", header = T, stringsAsFactors = F, dec = ".")

Electric <- Electric[Electric$Date %in% c("1/2/2007","2/2/2007"),]

setwd("C:/Users/Dell/Desktop/Bases de datos/ElectricPower")

##############################################################################

png(filename = "plot1.png", width = 480,height = 480)
hist(as.numeric(Electric$Global_active_power), col = "orange",main = "Global Active Power", xlab = "Global Active Power")
dev.off()
