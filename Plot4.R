## Code to read data and generate plot 2

## Read in Data

data<-read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE,sep=";")

#Select the two days of interest

TwoDays <- data[data$Date == "1/2/2007"| data$Date == "2/2/2007",]

#Make the data numberic for plotting

TwoDays[3:9] <- as.numeric(as.matrix(TwoDays[3:9]))

#Make a time and date object for plotting

Dates<-as.Date(as.character(TwoDays[,1]), format = "%d/%m/%Y")
Dates<-as.character(Dates)
Times<-as.character(TwoDays$Time)
FullDates<-paste(Dates, Times)
FullDates2<-strptime(FullDates,  format = "%Y-%m-%d %H:%M:%S")

#Make some levels for plotting the data in different colors later

DateData<-c(FullDates2,FullDates2,FullDates2)
SubMetData<-c(TwoDays$Sub_metering_1,TwoDays$Sub_metering_2,TwoDays$Sub_metering_3)
SubMetFactors<-gl(3,length(FullDates))

#Make plot 4

png(filename = "Plot4.png",width = 480, height = 480)
par(mfrow = c(2,2),mar=c(4,4,1,1))

#Upper left plot
plot(FullDates2,TwoDays$Global_active_power,"l", ylab="Global Active Power",xlab="")
#Upper right plot
plot(FullDates2,TwoDays$Voltage,"l", ylab="Voltage",xlab="datetime")
#Lower left plot
plot(DateData,SubMetData,"n", ylab = "Energy sub metering",xlab="")
points(DateData[SubMetFactors == 1],SubMetData[SubMetFactors == 1],"l",col="black")
points(DateData[SubMetFactors == 2],SubMetData[SubMetFactors == 2],"l",col="red")
points(DateData[SubMetFactors == 3],SubMetData[SubMetFactors == 3],"l",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n",lty=c(1,1,1))

#Lower right plot
plot(FullDates2,TwoDays$Global_reactive_power,"l", ylab="Global_rective_power",xlab="datetime")

dev.off()