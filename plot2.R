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


# Energy Sub Metering Linegraph
with(hpc,plot(Time,Global_active_power,type="n",xlab='',ylab="Global Active Power (killowatts)"))
with(hpc,lines(Time,Global_active_power))



# Copy it to a png
dev.copy(png,filename='plot2.png',width=480,height=480)
dev.off()





