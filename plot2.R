#Read the table from txt file located at the working director
mydata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE)

#Filter the data as per the given period
mydata <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007"), ]

#Format the date ,inorder to do this create a new column of datatime
mydata$DateTime <-as.POSIXct(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S") 

#Draw the plot
plot(x=mydata$DateTime, y=mydata$Global_active_power,type="l",xlab="",ylab="Global Active Power")

#copy to PNG file with Width and heigth as mentioned below
dev.copy(png,file="plot2.png",width = 480, height = 480, units = "px",pointsize=12)
dev.off()