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
                            householdPowerConsumptionSubset$Time), 
                            "%d/%m/%Y %H:%M:%S")

## Create "plot2.png" file
png("plot2.png", height = 480, width = 480)

## Create graphic
with(householdPowerConsumptionSubset, plot(dateTime, Global_active_power, 
                                       pch = ".", xlab = "", 
                                       ylab = "Global Active Power (kilowatts)"))
lines(householdPowerConsumptionSubset$dateTime, 
      householdPowerConsumptionSubset$Global_active_power)

## Close "plot2.png"
dev.off()