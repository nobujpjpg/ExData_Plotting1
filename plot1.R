setwd("~/Desktop")

a<-read.table("household_power_consumption.txt",header=T,sep=";")

a$Date<-as.Date(a$Date,format="%d/%m/%Y")

d1<-subset(a,Date=="2007-02-01")
d2<-subset(a,Date=="2007-02-02")

t<-rbind(d1,d2)

hist(as.numeric(as.character(t$Global_active_power)),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

dev.copy(png,file="plot1.png")

dev.off()