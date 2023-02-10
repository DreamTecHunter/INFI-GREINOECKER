setwd("C:/Users/Tobia/Documents/infi-Greinöcker-lab-report-5")
o <- read.csv("athlete_events.csv", sep=",", header=T)
#install.packages("ggplot2")
require(ggplot2)
#2a
qplot(o$NOC[o$Year==1896])
#2b
qplot(o[!is.na(o$Medal),]$Medal, o[!is.na(o$Medal),]$Age, geom=c("boxplot"), fill=(I("red")))+labs(x="Medal", y="Age")
#2c
qplot(o[!is.na(o$Medal),]$Medal, o[!is.na(o$Medal),]$Age, geom=c("violin"), fill=(I("red")))+labs(x="Medal", y="Age")
# an der dicksten Stelle in den Darstellungen befinden sich die meisten Medalliensieger.
#2d

#2e
over40 <- o[o$Age>40 & !is.na(o$Age),]
years <- as.numeric(over40$Year)
sport <- over40$Sport
medal <- over40$Medal
qplot(years, sport)+geom_point(color="darkblue")
qplot(years, medal)+geom_point(color="darkgreen")
#2f
over40WithMedal <- over40[!is.na(over40$Medal), ]
table(over40WithMedal$Age)
qplot(over40WithMedal$Year, over40WithMedal$Age)
#2g

#2h
