## Read in the data from household_power_consumption.txt
householdPowerConsumption <- read.table("household_power_consumption.txt", 
                                        sep = ";", header = TRUE, na.strings = "?")

## Get data for dates 1/2/2007 to 2/2/2007
householdPowerConsumptionSubset <- 
    householdPowerConsumption[which(householdPowerConsumption$Date == "1/2/2007" | 
                                        householdPowerConsumption$Date == "2/2/2007"),]
## Create a Date/Time Column
householdPowerConsumptionSubset$dateTime <- 
    strptime(paste(householdPowerConsumptionSubset$Date, 
                   householdPowerConsumptionSubset$Time), "%d/%m/%Y %H:%M:%S")

## Create "plot4.png" file
png("plot4.png", height = 480, width = 480)

## Create Graphic
par(mfcol = c(2,2))

with(householdPowerConsumptionSubset, {
    plot(dateTime, Global_active_power, pch = ".", xlab = "", ylab = "Global Active Power")
        lines(householdPowerConsumptionSubset$dateTime,
              householdPowerConsumptionSubset$Global_active_power)
        
    plot(dateTime, householdPowerConsumptionSubset$Sub_metering_1, xlab = "", 
         ylab = "Energy sub metering", type = "n")
        points(householdPowerConsumptionSubset$dateTime, 
               householdPowerConsumptionSubset$Sub_metering_1, pch = ".")
        lines(householdPowerConsumptionSubset$dateTime, 
              householdPowerConsumptionSubset$Sub_metering_1)
        points(householdPowerConsumptionSubset$dateTime, 
               householdPowerConsumptionSubset$Sub_metering_2, pch = ".", col = "red")
        lines(householdPowerConsumptionSubset$dateTime, 
              householdPowerConsumptionSubset$Sub_metering_2, col = "red")
        points(householdPowerConsumptionSubset$dateTime, 
               householdPowerConsumptionSubset$Sub_metering_3, pch = ".", col = "blue")
        lines(householdPowerConsumptionSubset$dateTime, 
              householdPowerConsumptionSubset$Sub_metering_3, col = "blue")
        legend("topright", lty = 1, col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(dateTime, Voltage, pch = ".", xlab = "datetime")
        lines(householdPowerConsumptionSubset$dateTime,
              householdPowerConsumptionSubset$Voltage)
        
    plot(dateTime, Global_reactive_power, pch = ".", xlab = "datetime")
        lines(householdPowerConsumptionSubset$dateTime,
              householdPowerConsumptionSubset$Global_reactive_power)
})

## Close "plot4.png"
dev.off()