##Set working directory were the file household_power_consumtion.txt is
setwd("~/Documents/Data_Science/Exploratory Data Analysis/")
##Read dataset (rule of thumb: 0.16 Gb needed to read data)
power_consumption_data<-read.table("household_power_consumption.txt", sep=";",header=TRUE,na.strings="?")
##Construct dataset with global active power and associated dates and times
global_active_power<-power_consumption_data$Global_active_power
time<-as.character(power_consumption_data$Time)
date<-as.Date(power_consumption_data$Date,"%d/%m/%Y")
data<-cbind(date,time, global_active_power)
##Subset on dates of interest
Dates2days<-as.data.frame(subset(data,date=="2007-02-01"|date=="2007-02-02"))##Construct histogram and have a look at it
##Subsetting transforms dates in factors, putting them back in Date format
Dates2days[,1]<-as.Date(as.numeric(as.character(Dates2days[,1])),origin="1970-01-01")
Sys.setlocale("LC_TIME","en_US.UTF-8") ##To obtain weekdays in english
##Defining the time lapse between 2007-02-01 and 2007-02-02
x<-as.vector(strptime(paste(Dates2days$date,Dates2days$time),format="%Y-%m-%d %H:%M:%S"))
##Global active power has also been put into factor, now it is put back to its numerical value
y<-as.numeric(as.character(Dates2days$global_active_power))
##Construct plot
plot(x,y,type="l",xlab="",ylab="Global Active Power (kilowatts)")
##Construct plot and save it on png file with right size
png(file = "plot2.png",width = 480, height = 480, units = "px")
plot(x,y,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(x,y)
dev.off()