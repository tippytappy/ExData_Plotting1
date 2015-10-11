plot1 <- function() {

  setwd("~/")
  require("data.table")

# download and unzip the data
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "~/HPC.zip", mode = "wb")
  unzip("HPC.zip")

# Read the unzipped file
  td <- read.table("household_power_consumption.txt", sep=";", header= TRUE, na.strings = c("?",""))

# convert the Date column to date format
  td$Date <- as.Date(td$Date, format = "%d/%m/%Y")

# conert the Time column to time format
  td$timestamp <- paste(td$Date, td$Time)
  td$Time <- strptime(td$timestamp, format = "%Y-%m-%d %H:%M:%S")

# make the date range subset
  day1 <- as.Date("1/2/2007", format = "%d/%m/%Y")
  day2 <- as.Date("2/2/2007", format = "%d/%m/%Y")
  daysub <- td$Date >= day1 & td$Date <= day2

# make the data set
  data <- td[daysub, ]

# make the pdf and put the histogram in it
  png(file = "~/Plot1.png")
  hist(data[,3], main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# close the device
  dev.off()

# tell the user their graph is ready
  message("The graph has been plotted")
}