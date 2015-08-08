## Read in the data from household_power_consumption.txt
householdPowerConsumption <- read.table("household_power_consumption.txt", 
                                    sep = ";", header = TRUE, na.strings = "?")

## Get data for dates 1/2/2007 to 2/2/2007
householdPowerConsumptionSubset <- 
householdPowerConsumption[which(householdPowerConsumption$Date == "1/2/2007" | 
                                householdPowerConsumption$Date == "2/2/2007"),]

## Create "plot1.png" file
png(file = "plot1.png", width = 480, height = 480)

## Create histogram from subsetted data and save to "plot1.png"
with(householdPowerConsumptionSubset, hist(Global_active_power, col = "red", 
    main = "Global Active Power", xlab = "Global Active Power"))

## Close "plot1.png"
dev.off()