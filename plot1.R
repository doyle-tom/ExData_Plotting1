# Reads individual household electric power consumption data and constructs 
# a plot saved as a 480px. x 480px. PNG file in the working director.
#
# Prerequisites:
#   Assumes the individual household electronic power consumption data set is
#   available in the working directory and named household_power_consumption.txt
#
#   Note: for the purpose of the assignment and efficiency, only the first line
#         of the file is initially read for header information, and then the 
#         rows specific to the assignment dataset are read starting at 66638   
#
# Output:
#   plot1.png: a histogram of Global Active Power (kilowatts)
#
# Returns:
#   none

#read the table to get the header information
powerConsumption <- read.table("household_power_consumption.txt", 
                               header=TRUE, sep=";", nrows=1)
col.names <- names(powerConsumption)

#read the rows that are relevant to the dataset
powerConsumption<-read.table("household_power_consumption.txt", 
                             col.names=col.names, sep=";", na.strings = "?", 
                             skip=66637, nrows=2880)

#combine the date and time fields into a single field for simplified plotting
powerConsumption$Date <- strptime( paste( as.Date(powerConsumption$Date, 
                                                  format="%d/%m/%Y"), 
                                          powerConsumption$Time ), 
                                   format="%Y-%m-%d %H:%M:%S" )

#open the PNG file device for the plot
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", 
    pointsize = 12, bg = "white")
hist( powerConsumption$Global_active_power, col="red", 
      main="Global Active Power", xlab="Global Active Power (kilowatts)")

#close the PNG file device
dev.off()
