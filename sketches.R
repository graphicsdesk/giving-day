library(tidyverse)
library(gridExtra)
library(grid)

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
f + geom_step()

# Combined Giving Day Stuff

p1 <- ggplot( ) + geom_step(data = GivingDay, aes(x = Year, y = CC, color = 'red'), color = 'red') + xlab('Year')+
  ylab('Fund Raised')
p2 <- ggplot( ) + geom_step(data = GivingDay, aes(x = Year, y = Athletics, color = 'blue'), color = 'blue') + xlab('Year')+
  ylab('Fund Raised') 
p3 <- ggplot( ) + geom_step(data = GivingDay, aes(x = Year, y = Columbia.Engineering, color = 'green'), color = 'green') + xlab('Year')+
  ylab('Fund Raised')
p4 <- ggplot( ) + geom_step(data = GivingDay, aes(x = Year, y = Columbia.Business.School, color = 'yellow'), color = 'yellow') + xlab('Year')+
  ylab('Fund Raised')
p5 <- ggplot( ) + geom_step(data = GivingDay, aes(x = Year, y = Barnard.College, color = 'pink'), color = 'pink') + xlab('Year')+
  ylab('Fund Raised')
p6 <- ggplot( ) + geom_step(data = GivingDay, aes(x = Year, y = GS, color = 'purple'), color = 'purple') + xlab('Year')+
  ylab('Fund Raised')


grid.arrange(
  p1,
  p2,
  p3,
  p4,
  p5,
  p6,
  nrow = 2)
