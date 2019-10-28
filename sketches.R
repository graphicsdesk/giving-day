library(tidyverse)

Data <- read.csv("Form990.csv")
GivingDay <- read.csv("GivingDayData.csv")



# Fundraising Fee trend throughout the year 
p <- ggplot(data = Data, 
            aes(x = Year, y = X1Total.fundraising.expenses)
            )
p + geom_line()

# Total Fundrasing Expenses vs. Revenue from fundraising events
g <-  ggplot(data = Data, 
             aes(x = X1Total.fundraising.expenses,
                 y = VIII.1c..Revenue..Fundraising.events))

g + geom_line() + coord_cartesian(xlim=c(85495196,120000000), ylim=c(0,14290459))
  #+ xlim (85495196,120000000)

# Giving Day Revenue throughout the year
f <- ggplot(data = GivingDay, mapping = aes(x = Year, y = Total))
f + geom_line()

# Fundrasing Fee and Giving Day data on the same graph
CombData <- data.frame("Year" = Data$Year, "Fundraising" = Data$X1Total.fundraising.expenses,
                       "Giving" = GivingDay$Total)

