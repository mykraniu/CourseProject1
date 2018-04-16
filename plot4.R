# ====================================
# ==  Script: Plot1.R
# ==  Description: 
# ==  Authour: Michael Dovel
# ====================================


# Clean data and setup working directories
rm(list=ls())
setwd("~/GitHub/CourseProject1")

# Load Libraries
library(dplyr)

# Read in the data (Data has been prefiltered for memory saving purposes)
hpc <- read.table("household_power_consumption_feb_2007.txt",sep=";",header=TRUE)


# Convert Date and Time to R Date/Time Classes
hpc <- hpc %>%
  mutate(Time=as.POSIXct(strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S")),
         Date=as.Date(Date,format="%d/%m/%Y"),
         Global_active_power=as.numeric(as.character(Global_active_power)),
         Global_reactive_power=as.numeric(as.character(Global_reactive_power)),
         Voltage=as.numeric(as.character(Voltage)),
         Global_intensity=as.numeric(as.character(Global_intensity)),
         Sub_metering_1=as.numeric(as.character(Sub_metering_1)),
         Sub_metering_2=as.numeric(as.character(Sub_metering_2)),
         Sub_metering_3=as.numeric(as.character(Sub_metering_3)))


# Setup the four plot zone
par(mfcol=c(2,2))


# Global Active Power/Time Linegraph
with(hpc,plot(Time,Global_active_power,type="n",xlab='',ylab="Global Active Power (killowatts)"))
with(hpc,lines(Time,Global_active_power))



# Energy Sub Metering Linegraph
with(hpc,plot(Time,Sub_metering_1,type="n",xlab='',ylab="Energy sub metering"))
with(hpc,lines(Time,Sub_metering_1,col="black"))
with(hpc,lines(Time,Sub_metering_2,col="red"))
with(hpc,lines(Time,Sub_metering_3,col="blue"))
legend("topright",cex=0.35,col=c("black","red","blue"),lty=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


# Voltage / Datetime line graph
with(hpc,plot(Time,Voltage,type="n",xlab='datetime',ylab="Voltage"))
with(hpc,lines(Time,Voltage))

# Voltage / Datetime line graph
with(hpc,plot(Time,Global_reactive_power,type="n",xlab='datetime',ylab="Global_reactive_power"))
with(hpc,lines(Time,Global_reactive_power))




# Copy it to a png
dev.copy(png,filename='plot4.png',width=480,height=480)
dev.off()





