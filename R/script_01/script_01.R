x = 1
y <- 2
x+y
1:100
1:100 + 1


z = 1:100 + 1
z[1]

seq(1,100,0.5)

mean(z)
quantile(z)
min(z)
max(z)
median(z)
z[2:10]
i <- c(1,2,33,4)
z[i]
z < 10

z[z<10]

10 %% 8

rn <- rnorm(100)
plot(rn)
hist(rn)
boxplot(rn, col="red")

rn <- rnorm(100)


x <- c("N", "E", "S", "W", "S")
y <- c(1.5,6,7,2,0.9)
z <- c(T,T,T,F,F)
df <- data.frame(x,y,z)
df$y[3]
df[1,3]
df[,2:3]
View(df)
m <- c('Jan','Jan','Feb', 'Jan','Feb','Apr','Mar','Mar','Mar', 'Apr')
#Die Monate sollen natürlich in der aufsteigenden Reihenfolge abgelegt werden
#für die weitere Verarbeitung
monate <- factor(m, levels=c('Jan','Feb','Mar', 'Apr'));
monate
as.numeric(monate)
temp <- c(23,3,21,3,28,34,22,31,34,2)


#Hier werden leider die Datentypen vereinheitlicht (alles Zahlen)
cbind(monate, temp)

#Hier bleiben die Datentypen bestehen
df <- data.frame(monate, temp)

#Alle Werte werden pro Faktor als Boxplot dargestellt (in der richtigen Monats-Reihenfolge)
plot(df, col="red")