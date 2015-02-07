# Create plot1.png - Global Active Power v. Frequency
#
# Using a truncated version of the data set in
# household_power_consumption_trunc.txt (contains only Feb 1-2, 2007)


do.plot1 <- function() {
    in.file <- "household_power_consumption_trunc.txt"
    data <- read.csv(in.file, sep=";")

    # write the plot
    hist(data$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
}

make.plot1 <- function() {
    # open file for plotting (480x480 is the default)
    out.file <- "plot1.png"
    png(out.file)

    do.plot1()

    # close the file
    dev.off()
}

make.plot1()
