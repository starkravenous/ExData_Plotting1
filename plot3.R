# Create plot3.png - Submetering over time
#
# Using a truncated version of the data set in
# household_power_consumption_trunc.txt (contains only Feb 1-2, 2007)

do.plot3 <- function() {
    in.file <- "household_power_consumption_trunc.txt"
    data <- read.csv(in.file, sep=";")
    dates <- as.Date(data$Date, format="%d/%m/%Y")
    days <- substring(weekdays(dates), 1, 3)

    middle <- match("Fri", days)
    last <- length(days)

    # write the plot
    plot(data$Sub_metering_1, xaxt='n', xlab='', type='l', ylab="Energy sub metering")
    lines(data$Sub_metering_2, col='red', type='l')
    lines(data$Sub_metering_3, col='blue', type='l')
    axis(1, at=c(1,middle,last), labels=c(days[1],days[middle],"Sat"))
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1))
}

make.plot3 <- function() {
    # open file for plotting (480x480 is the default)
    out.file <- "plot3.png"
    png(out.file)

    do.plot3()

    # close the file
    dev.off()
}

make.plot3()
