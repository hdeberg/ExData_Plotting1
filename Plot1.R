## Code to read data and generate plot 1


## Read in Data
data<-read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE,sep=";")

#Select the two days of interest
TwoDays <- data[data$Date == "1/2/2007"| data$Date == "2/2/2007",]

#Make the data numberic for plotting
TwoDays[3:9] <- as.numeric(as.matrix(TwoDays[3:9]))

#Plot histogram and save as Plot1.png

png(filename = "Plot1.png",width = 480, height = 480)
hist(TwoDays$Global_active_power, col = "red",xlab = "Global Active Power (kilowatts)", main="Global Active Power")

dev.off()