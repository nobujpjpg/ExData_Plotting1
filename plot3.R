setwd("~/Desktop")

a<-read.table("household_power_consumption.txt",header=T,sep=";")

a$Date<-as.Date(a$Date,format="%d/%m/%Y")

d1<-subset(a,Date=="2007-02-01")
d2<-subset(a,Date=="2007-02-02")

t<-rbind(d1,d2)

Sys.setlocale("LC_TIME", "en_US")

timestamp=format(as.POSIXct(paste(t$Date, t$Time)), "%Y/%m/%d %H:%M:%S")
b<-strptime(timestamp,"%Y/%m/%d %H:%M:%S")

x1<-as.numeric(as.character(t$Sub_metering_1 ))
x2<-as.numeric(as.character(t$Sub_metering_2 ))
x3<-as.numeric(as.character(t$Sub_metering_3 ))

plot(b,x1,type="l",lwd="1",xlab="",ylab="Energy Sub metering",ylim=c(0,max(x1)))
par(new=T) 
plot(b,x2,type="l",lwd="1",xlab="",ylab="Energy Sub metering",ylim=c(0,max(x1)),col="red")
par(new=T) 
plot(b,x3,type="l",lwd="1",xlab="",ylab="Energy Sub metering",ylim=c(0,max(x1)),col="blue")

legend("topright",
    legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
    ,lty=c(1,1,1),
    col=c("black", "red", "blue")
    )

dev.copy(png,file="plot3.png")

dev.off()