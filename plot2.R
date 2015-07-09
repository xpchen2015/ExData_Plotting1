setwd("C:/Users/Xiaopei/Desktop/EDA")
#setwd("C:/Users/rli/Desktop/EDA")

#mydata<-read.table("household_power_consumption.txt")
#head(mydata)

#testdata <- read.table("household_power_consumption.txt", header=TRUE,sep=";",nrow=2, colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
#Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings,  : 
#scan() expected 'a real', got '?'
#because: Note that in this dataset missing values are coded as ?., the error comes with colClasses

#in order to read large dataset quick, define parameters in read.table function
Rdata <- read.table("household_power_consumption.txt", header=TRUE,sep=";",nrows=70000)
Rdata$Date<-as.character(Rdata$Date)
Rdata$Time<-as.character(Rdata$Time)

#ProjData1<-Rdata[(Rdata$Date=="1/2/2007"),]
#ProjData2<-Rdata[(Rdata$Date=="2/2/2007"),]
ProjData<-Rdata[(Rdata$Date=="1/2/2007" | Rdata$Date=="2/2/2007"),]

#ProjData$Date<-as.Date(ProjData$Date,"%d/%m/%Y")

DT<-paste(ProjData$Date, ProjData$Time)

x<-strptime(DT,"%d/%m/%Y %H:%M:%S")

ProjData$Global_active_power<-as.numeric(levels(ProjData$Global_active_power))[ProjData$Global_active_power]

plot(x,ProjData$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

#ProjData$Global_active_power<-as.numeric(ProjData$Global_active_power), this is not correct. Need to convert from factor to numeric
 

dev.copy(png, file = "plot2.png")
dev.off()

