# Author Tim
# 16-10-2016

# read file and select subset
hpc <- read.table("household_power_consumption.txt",sep=";", header = TRUE, nrows = 100000, na.strings = "?")
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
hpc <- hpc[hpc$datetime >= strptime("01/02/2007", "%d/%m/%Y") & hpc$datetime < strptime("03/02/2007", "%d/%m/%Y"),]

# x-axis is in dutch but this function does not correct for that.
system("defaults write org.R-project.R force.LANG en_US.UTF-8") 

# plot2
png(file="plot2.png")
# lables still in dutch, sorry.
plot(hpc$datetime, hpc$Global_active_power, ylab="Global Active Power (kilowatts)", xlab ="", type = "l")
dev.off()