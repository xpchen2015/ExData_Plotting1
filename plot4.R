setwd("C:/Users/Xiaopei/Desktop/EDA")

Rdata <- read.table("household_power_consumption.txt", header=TRUE,sep=";",nrows=70000)
Rdata$Date<-as.character(Rdata$Date)
Rdata$Time<-as.character(Rdata$Time)

ProjData<-Rdata[(Rdata$Date=="1/2/2007" | Rdata$Date=="2/2/2007"),]

DT<-paste(ProjData$Date, ProjData$Time)
x<-strptime(DT,"%d/%m/%Y %H:%M:%S")

# convert factor columns to numeric
ProjData$Sub_metering_1<-as.numeric(levels(ProjData$Sub_metering_1))[ProjData$Sub_metering_1]
ProjData$Sub_metering_2<-as.numeric(levels(ProjData$Sub_metering_2))[ProjData$Sub_metering_2]
ProjData$Sub_metering_3<-as.numeric(levels(ProjData$Sub_metering_3))[ProjData$Sub_metering_3]
ProjData$Global_active_power<-as.numeric(levels(ProjData$Global_active_power))[ProjData$Global_active_power]
ProjData$Global_reactive_power<-as.numeric(levels(ProjData$Global_reactive_power))[ProjData$Global_reactive_power]
ProjData$Voltage<-as.numeric(levels(ProjData$Voltage))[ProjData$Voltage]

#par(mfrow=c(2,2),mar=c(4, 4, 2, 1)) #c(bottom, left, top, right)
par(mfrow=c(2,2))
plot(x,ProjData$Global_active_power,type="l",ylab="Global Active Power",xlab="",col="black")
plot(x,ProjData$Voltage,type="l",ylab="Voltage",xlab="datetime",col="black")

ymax<-max(range(ProjData$Sub_metering_1),range(ProjData$Sub_metering_2),range(ProjData$Sub_metering_3))
plot(x,ProjData$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black",ylim=c(0, ymax))
par(new=TRUE)
plot(x,ProjData$Sub_metering_2,type="l",ylab="",xlab="",col="red",ylim=c(0, ymax),axes=FALSE)
par(new=TRUE)
plot(x,ProjData$Sub_metering_3,type="l",ylab="",xlab="",col="blue",ylim=c(0, ymax),axes=FALSE)
#legend("topright", lty=1,col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")): this is too large
legend('topright', lty=1, col = c("black","red", "blue"), bty='n', cex=.75,legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(x,ProjData$Global_reactive_power,type="l",lwd=1,ylab="Global_reactive_power",xlab="datetime",col="black")


dev.copy(png, file = "plot4c.png")
dev.off()

