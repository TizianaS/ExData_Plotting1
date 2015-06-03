##Set working directory were the file household_power_consumtion.txt is
setwd("~/Documents/Data_Science/Exploratory Data Analysis/")
##Read dataset (rule of thumb: 0.16 Gb needed to read data)
power_consumption_data<-read.table("household_power_consumption.txt", sep=";",header=TRUE,na.strings="?")
##Construct dataset with Sub_metering and associated dates and times
time<-as.character(power_consumption_data$Time)
date<-as.Date(power_consumption_data$Date,"%d/%m/%Y")
data<-cbind(date,time,power_consumption_data[grep("Sub",names(power_consumption_data))])
##Subset on dates of interest
Dates2days<-as.data.frame(subset(data,date=="2007-02-01"|date=="2007-02-02"))##Construct histogram and have a look at it
Sys.setlocale("LC_TIME","en_US.UTF-8") ##To obtain weekdays in english
##Defining the time lapse between 2007-02-01 and 2007-02-02
x<-as.vector(strptime(paste(Dates2days$date,Dates2days$time),format="%Y-%m-%d %H:%M:%S"))
##Selecting sub metering variables
y1<-Dates2days$Sub_metering_1
y2<-Dates2days$Sub_metering_2
y3<-Dates2days$Sub_metering_3
##Construct plot
plot(x,y1,type="l",xlab="",ylab="Energy sub metering")
lines(x,y2,col="red");lines(x,y3,col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5),col=c("black","blue","red")) 
##Construct plot and save it on png file with right size
png(file = "plot3.png",width = 480, height = 480, units = "px")
plot(x,y1,type="l",xlab="",ylab="Energy sub metering")
lines(x,y2,col="red");lines(x,y3,col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5),col=c("black","blue","red")) 
dev.off()