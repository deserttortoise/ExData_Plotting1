setwd("C:/R/Course_4/")

myfile="C:/R/Course_4/household_power_consumption.txt"

data=read.delim2(myfile,sep=";",na.strings="?")

data$Date2 <- as.Date( as.character(data$Date),"%d/%m/%Y")


mydata <- subset(data, Date2 >= as.Date("2007-02-01") & Date2 <= as.Date("2007-02-02"))


gap=as.numeric(mydata$Global_active_power)/1000

hist(gap,col="red",breaks=14,main="Global Active Power",xlab="Global Active Power(kilowatts")

dev.copy(png,file="Plot1.png")
dev.off()