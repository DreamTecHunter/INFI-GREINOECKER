#1
#1.1
#1.1.1
  #data from 100 to 200
a <- 100:200
a
#1.1.2
  #data from 100 to 200 in 2-steps
b <- seq(100,200,2)
b
#1.1.3
  #100 normal distributed numbers
c <- rnorm(100) 
c
  #100 uniform distributed numbers
d <- runif(100)
d
#2
x <- c
y <- d
x
y
#2.1
  #average
xAverage <- mean(x)
yAverage <- mean(y)
xAverage
yAverage
  #median
xMedian <- mode(x)
yMedian <- mode(y)
xMedian
yMedian
  #minimum
xMin <- min(x)
yMin <- min(y)
xMin
yMin
  #maximum
xMax <- max(x)
yMax <- max(y)
xMax
yMAx
  #standard deviation
xStandDeviat <- sd(x)
yStandDeviat <- sd(y)
xStandDeviat
yStandDeviat
#2.2
x100 <- x*100
y100 <- y*100
x100
y100
#2.3
xFirst10 <- x100[0:10]
yFirst10 <- y100[0:10]
xFirst10
yFirst10
#2.4
xFirst10Higher0 <- xFirst10[xFirst10 > 0]
yFirst10Higher0 <- yFirst10[yFirst10 > 0]
xFirst10Higher0
yFirst10Higher0
#3
c
#3.1
plot(c, type="l")
#3.2
boxplot(c, col="red")
#4
#4.1
dayOfWeek <- c("MON","TUE", "WED","THU", "FRI","SAT","SAN")
dayOfWeek
#4.2
hoursADay <- c(9,9,9,9,5,0,0)
numberOfWeekDay <- c(1,2,3,4,5,6,7)
dataFrameWeek <- data.frame(dayOfWeek,numberOfWeekDay,hoursADay)
hoursADay
numberOfWeekDay
dataFrameWeek
#5
#5.1
values1 <- rnorm(1000)
values2 <- rnorm(1000)
#5.2
sex <- c(rep('m',500),rep('w',500))
dataFrameCombi <- data.frame(values1, values2,sex)
dataFrameCombi
sex
#5.3
names(dataFrameCombi)[1] <- "First norm"
names(dataFrameCombi)[2] <- "Second norm"
names(dataFrameCombi)[3] <- "Sex (male, female)"
names(dataFrameCombi)
#5.4
boxplot(dataFrameCombi$`First norm`~dataFrameCombi$`Sex (male, female)`, col=c("blue","red"))

        