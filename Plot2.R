setwd("C:/R/Course_4/")
myfile="C:/R/Course_4/household_power_consumption.txt"

data=read.delim2(myfile,sep=";",na.strings="?")

data$Date2 <- as.Date( as.character(data$Date),"%d/%m/%Y")



mydata <- subset(data, Date2 >= as.Date("2007-02-01") & Date2 <= as.Date("2007-02-02"))


mydata$x=paste(mydata$Date,mydata$Time)


mydata$date_Time=strptime(mydata$x, format="%d/%m/%Y %H:%M:%S")

mydata$gap=as.numeric(mydata$Global_active_power)/1000

with(mydata,plot(date_Time,gap,type="l",ylab="Global Active Power (killowatts)",xlab=""))


dev.copy(png,file="Plot2.png")
dev.off()
