# Create plot2.png - Global Active Power over time
#
# Using a truncated version of the data set in
# household_power_consumption_trunc.txt (contains only Feb 1-2, 2007)

make.plot2 <- function() {
    in.file <- "household_power_consumption_trunc.txt"
    out.file <- "plot2.png"
    data <- read.csv(in.file, sep=";")
    dates <- as.Date(data$Date, format="%d/%m/%Y")
    days <- substring(weekdays(dates), 1, 3)

    middle <- match("Fri", days)
    last <- length(days)

    # open file for plotting (480x480 is the default)
    png(out.file)

    # write the plot
    plot(data$Global_active_power, xaxt='n', xlab='', type='l', ylab="Global Active Power (kilowatts)")
    axis(1, at=c(1,middle,last), labels=c(days[1],days[middle],"Sat"))

    # close the file
    dev.off()
}

make.plot2()
