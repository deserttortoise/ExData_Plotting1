setwd("C:/R/Course_4/")
myfile="C:/R/Course_4/household_power_consumption.txt"

data=read.delim2(myfile,sep=";",na.strings="?")

data$Date2 <- as.Date( as.character(data$Date),"%d/%m/%Y")



mydata <- subset(data, Date2 >= as.Date("2007-02-01") & Date2 <= as.Date("2007-02-02"))


mydata$x=paste(mydata$Date,mydata$Time)


mydata$date_Time=strptime(mydata$x, format="%d/%m/%Y %H:%M:%S")


with(mydata,plot(date_Time,Sub_metering_1,type="l",ylab="Energy Sub Meeting",xlab=""))
with(mydata,lines(date_Time,Sub_metering_2,type="l",col="blue"))
with(mydata,lines(date_Time,Sub_metering_3,type="l",col="red"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_meteing_3"),col=c("black","blue","red"),bg="white",lwd=2)



dev.copy(png,file="Plot3.png")
dev.off()