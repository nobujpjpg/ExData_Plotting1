setwd("~/Desktop")

a<-read.table("household_power_consumption.txt",header=T,sep=";")

a$Date<-as.Date(a$Date,format="%d/%m/%Y")

d1<-subset(a,Date=="2007-02-01")
d2<-subset(a,Date=="2007-02-02")

t<-rbind(d1,d2)

Sys.setlocale("LC_TIME", "en_US")

timestamp=format(as.POSIXct(paste(t$Date, t$Time)), "%Y/%m/%d %H:%M:%S")
b<-strptime(timestamp,"%Y/%m/%d %H:%M:%S")

x<-as.numeric(as.character(t$Global_active_power))

plot(b,x,type="l",lwd="1",xlab="",ylab="Global Active Power (kilowatts)")

dev.copy(png,file="plot2.png")

dev.off()