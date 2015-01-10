#Read the table from txt file located at the working director
mydata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors = FALSE)

#Filter the data as per the given period
mydata <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007"), ]

#Draw the historian plot
hist(x=mydata$Global_active_power,col="red",xlab="Global Active Power (Killowatts)",main="Global Active Power")

#copy to PNG file with Width and heigth as mentioned below
dev.copy(png,file="plot1.png",width = 480, height = 480, units = "px",pointsize=12)
dev.off()
 