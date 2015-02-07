# Create plot4.png - Multiple subplots
#
# Using a truncated version of the data set in
# household_power_consumption_trunc.txt (contains only Feb 1-2, 2007)

do.plot4_a <- function() {
}

do.plot4_b <- function() {
    in.file <- "household_power_consumption_trunc.txt"
    data <- read.csv(in.file, sep=";")

    # write the plot
    plot(data$Sub_metering_1, xaxt='n', xlab='', type='l', ylab="Energy sub metering")
    lines(data$Sub_metering_2, col='red', type='l')
    lines(data$Sub_metering_3, col='blue', type='l')
    axis(1, at=c(1,middle,last), labels=c(days[1],days[middle],"Sat"))
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1))
}

do.plot4 <- function() {
    source("plot2.R")
    source("plot3.R")

    par(mfrow=c(2,2))

    # write the plots
    do.plot2()
    do.plot2("Voltage", "Voltage", "datetime")
    do.plot3()
    do.plot2("Global_reactive_power", "Global_reactive_power", "datetime")
}

make.plot4 <- function() {
    # open file for plotting (480x480 is the default)
    out.file <- "plot4.png"
    #png(out.file)

    do.plot4()

    # close the file
    #dev.off()
}

make.plot4()
