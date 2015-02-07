# Create plot2.png - Global Active Power over time
#
# Using a truncated version of the data set in
# household_power_consumption_trunc.txt (contains only Feb 1-2, 2007)

do.plot2 <- function(col="Global_active_power",name="Global Active Power (kilowatts)", xlabel="") {
    in.file <- "household_power_consumption_trunc.txt"
    data <- read.csv(in.file, sep=";")
    dates <- as.Date(data$Date, format="%d/%m/%Y")
    days <- substring(weekdays(dates), 1, 3)

    middle <- match("Fri", days)
    last <- length(days)

    # write the plot
    plot(data[,col], xaxt='n', xlab=xlabel, type='l', ylab=name)
    axis(1, at=c(1,middle,last), labels=c(days[1],days[middle],"Sat"))
}

make.plot2 <- function() {
    # open file for plotting (480x480 is the default)
    out.file <- "plot2.png"
    png(out.file)

    do.plot2()

    # close the file
    dev.off()
}

make.plot2()
