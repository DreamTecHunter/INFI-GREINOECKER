#Setzen des Arbeitsverzeichnisses. Von hier werden alle Dateien geladen 
#(und später auch gespeichert)
setwd("/Users/tobia/OneDrive/Dokumente/_SWP_Greinöcker-R-LeX/script_02")

#Einlesen des Datensatzes mit Trennzeichen ;
d <- read.csv("bev_meld.csv", sep=";", encoding="UTF-8") 
d #einfach nur ausgeben

#Gib eine Zusammenfassung des kompletten Data frames aus
summary(d)

# Wie gross ist der Data Frame
dim(d)

#Welche Spaltenbeschriftungen hat der Data Frame
names(d)
#Erzeuge neue Variablennamen. Paste kombiniert Strings und gibt ein Trennzeichen (sep) dazwischen 
new_names <- paste("j", 1992:2018, sep="")
#Zuweisung nur der Namen für die Jahre
names(d)[4:30] <- new_names 

plot(d[d$Bezirk == "I", 4:30])

#Wähle nur die Zahlenwerden von Innsbruck aus. 
#Nur eine Zeile wird ausgewählt, weil Innsbruck nur eine Gemeinde hat
ibk <- as.numeric(d[d$Bezirk == "I",4:30])
plot(ibk, col="red", type="l")
#Wähle nur die Zahlenwerden von Innsbruck Land aus
#Jede Zeile steht für eine Gemeinde
il <- d[d$Bezirk == "IL",4:30]

# Möchte man die Zeilen zusammenfassen (hier aufsummieren), verwendet man apply
# 1...Zeilenweise, 2, Spaltenweise
# Andere Funktionen: sum, min, max, mean, median
ibk_land <- apply(il,2, FUN =sum)

#Trage die Werte mit der Korrekten Jahresbeschriftung auf
plot(1992:2018,ibk_land, 
     pch="a",
     type="p", col="red", 
     xlab="Jahre", ylab="Bevölkerung", 
     main="Bevölkerungsentwicklung",
     sub=" Innsbruck Land")

#Aufsummieren über die Jahre
bev_pro_jahr <- apply(d[,4:30],2, FUN =sum)

#Bevölkerung in den einzelnen Bezirken
bev_sum_bezirk <- aggregate(d[,4:30], by=list(d$Bezirk), FUN =sum)

#Boxplot, der die Verteilung aller Bezirke vergleicht 
#Innsbruck (also die erste Zeile) wird ausgenommen
boxplot(d[-1,30]~d$Bezirk[-1], col=rainbow(9))

#Bilde den Durschnitt aller Werte aller Gemeinden und erzeuge eine neue Spalte
d$durchschnitt <- apply(d[,4:30],1,FUN=mean)
d$min <- apply(d[,4:30],1,FUN=min)
d$max <- apply(d[,4:30],1,FUN=max)
d$range <- d$max - d$min
d$range_stand <- d$range / d$durchschnitt

