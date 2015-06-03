##Set working directory were the file household_power_consumtion.txt is
setwd("~/Documents/Data_Science/Exploratory Data Analysis/")
##Read dataset (rule of thumb: 0.16 Gb needed to read data)
power_consumption_data<-read.table("household_power_consumption.txt", sep=";",header=TRUE,na.strings="?")
##Construct dataset with global active power and associated dates
global_active_power<-power_consumption_data$Global_active_power
date<-as.Date(power_consumption_data$Date,"%d/%m/%Y")
data<-cbind(date,global_active_power)
##Subset on dates of interest, "2007-02-01" and "2007-02-02"
data2days<-as.data.frame(subset(data,date=="2007-02-01"|date=="2007-02-02"))
##Construct histogram and have a look at it
hist(data2days$global,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
##Construct histogram and save it on png file with right size
png(file = "plot1.png",width = 480, height = 480, units = "px")
hist(data2days$global,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()