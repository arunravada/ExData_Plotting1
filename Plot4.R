#Read the table from txt file located at the working director
mydata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE)
#Filter the data as per the given period
mydata <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007"), ]
#Format the date ,inorder to do this create a new column of datatime
mydata$DateTime <-as.POSIXct(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S")
par(mar=c(4,4,2,2))
par(mfrow =c(2,2))
#Draw the (1,1) plot
plot(x=mydata$DateTime, y=mydata$Global_active_power,type="l",xlab="",ylab="Global Active Power")
#Draw(1,2) Plot
plot(x=mydata$DateTime,y=mydata$Voltage,col="black",ylab="Voltage",type="l",xlab="datetime")
#Draw(2,1) Plot
plot(x=mydata$DateTime,y=mydata$Sub_metering_1,col="black",ylab="Energy sub metering",type="l",xlab="")
lines(x=mydata$DateTime,y=mydata$Sub_metering_2,col="red")
lines(x=mydata$DateTime,y=mydata$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1))
#Draw(2,2) Plot
plot(x=mydata$DateTime,y=mydata$Global_reactive_power,col="black",ylab="Global_reactive_power",type="l",xlab="datetime")
#copy to PNG file with Width and heigth as mentioned below
dev.copy(png,file="plot4.png",width = 480, height = 480, units = "px",pointsize=12)
dev.off()
