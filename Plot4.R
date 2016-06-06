setwd("C:/R/Course_4/")
myfile="C:/R/Course_4/household_power_consumption.txt"

data=read.delim2(myfile,sep=";",na.strings="?")

data$Date2 <- as.Date( as.character(data$Date),"%d/%m/%Y")



mydata <- subset(data, Date2 >= as.Date("2007-02-01") & Date2 <= as.Date("2007-02-02"))


mydata$x=paste(mydata$Date,mydata$Time)


mydata$date_Time=strptime(mydata$x, format="%d/%m/%Y %H:%M:%S")
mydata$gap=as.numeric(mydata$Global_active_power)/1000


par(mfrow=c(2,2))

with(mydata,plot(date_Time,gap,type="l",ylab="Global Active Power (killowatts)",xlab=""))

with(mydata,plot(date_Time,Voltage,type="l"),xlab="datetime")


with(mydata,plot(date_Time,Sub_metering_1,type="l",ylab="Energy Sub Meeting",xlab=""))
with(mydata,lines(date_Time,Sub_metering_2,type="l",col="blue"))
with(mydata,lines(date_Time,Sub_metering_3,type="l",col="red"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_meteing_3"),col=c("black","blue","red"),bg="white",lwd=2)

with(mydata,plot(date_Time,Global_reactive_power,type="l"),xlab="datetime")

dev.copy(png,file="Plot4.png")
dev.off()