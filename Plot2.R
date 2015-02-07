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

#Make plot 2
png(filename = "Plot2.png",width = 480, height = 480)
plot(FullDates2,TwoDays$Global_active_power,"l", ylab="Global Active Power (kilowatts)",xlab="")
dev.off()