setwd("C:/Users/Xiaopei/Desktop/EDA")

Rdata <- read.table("household_power_consumption.txt", header=TRUE,sep=";",nrows=70000)
Rdata$Date<-as.character(Rdata$Date)
Rdata$Time<-as.character(Rdata$Time)

ProjData<-Rdata[(Rdata$Date=="1/2/2007" | Rdata$Date=="2/2/2007"),]

DT<-paste(ProjData$Date, ProjData$Time)
x<-strptime(DT,"%d/%m/%Y %H:%M:%S")

# convert factor column to numeric
ProjData$Sub_metering_1<-as.numeric(levels(ProjData$Sub_metering_1))[ProjData$Sub_metering_1]
ProjData$Sub_metering_2<-as.numeric(levels(ProjData$Sub_metering_2))[ProjData$Sub_metering_2]
ProjData$Sub_metering_3<-as.numeric(levels(ProjData$Sub_metering_3))[ProjData$Sub_metering_3]

## Send a copy to the plotX.png output file
png("plot3.png", width=480, height=480)

ymax<-max(range(ProjData$Sub_metering_1),range(ProjData$Sub_metering_2),range(ProjData$Sub_metering_3))

plot(x,ProjData$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black",ylim=c(0, ymax))
par(new=TRUE)
plot(x,ProjData$Sub_metering_2,type="l",ylab="",xlab="",col="red",ylim=c(0, ymax),axes=FALSE)
par(new=TRUE)
plot(x,ProjData$Sub_metering_3,type="l",ylab="",xlab="",col="blue",ylim=c(0, ymax),axes=FALSE)

legend("topright",lty=1,col = c("black","red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#dev.copy(png, file = "plot3.png")

dev.off()

