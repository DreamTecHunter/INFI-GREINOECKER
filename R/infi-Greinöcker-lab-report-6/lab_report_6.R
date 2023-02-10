# setwd("C:/Users/Tobia/Documents/infi-Greinöcker-lab-report-6")
print(getwd())
#1 MySQL-Vorbereitung
# Download oder Klonen der Dateien über github https://github.com/datacharmer/test_db
# Installation der Datenbank über cmd hat nicht funktioniert, daher direkt in MySQL-Workbench die Employee.sql ausgeführt.
#2 Datenbank-Verbindung vorbereiten
require(RMySQL)
# Wenn das Paket nicht installiert ist,  taucht (wenn nicht evtl. speichern) im Oberen Datei-Bereich ein Balken auf,
# und man lässt RStudio die nötigen Pakete installieren
dbConnection = dbConnect(MySQL(), user="infi-greinoecker", password="infi-greinoecker", dbname="employees", host="localhost")
tables = dbListTables(dbConnection)
#2.1 Auswertungen
#2.1.1
query <- "SELECT  departments.dept_name as abteilung, dept_emp.emp_no as anzahl_mitarbeiter FROM dept_emp RIGHT JOIN departments ON dept_emp.dept_no = departments.dept_no WHERE dept_emp.to_date = \"9999-01-01\" ORDER BY dept_emp.dept_no;"
resultsWorkingPeople <- dbSendQuery(dbConnection, query) 
dataWorkingPeople <- fetch(resultsWorkingPeople, -1)
boxplot(dataWorkingPeople$anzahl_mitarbeiter~dataWorkingPeople$abteilung, las=2, xlab = "", ylab = "")
#2.1.2
query <- "SELECT employees.emp_no, sum(salaries.salary), employees.gender FROM salaries LEFT JOIN employees ON salaries.emp_no = employees.emp_no GROUP BY employees.emp_no;"
resultSalaryOverGender <- dbSendQuery(dbConnection, query)
dataSalaryOverGender<- fetch(resultSalaryOverGender, -1)
boxplot(dataSalaryOverGender$`sum(salaries.salary)`~dataSalaryOverGender$gender, xlab = "Gender", ylab = "Verdienst")
#2.1.3
query <- "SELECT sum(salary) as salaries, d.dept_name as abteilung FROM salaries s INNER JOIN dept_emp de ON s.emp_no = de.emp_no INNER JOIN departments d ON de.dept_no = d.dept_no GROUP BY de.emp_no ORDER BY d.dept_no;"
resultSalaryOverDepartment <- dbSendQuery(dbConnection, query)
dataSalaryOverDepartment <- fetch(resultSalaryOverDepartment, -1)
boxplot(dataSalaryOverDepartment$salaries~dataSalaryOverDepartment$abteilung, las=2, xlab = "", ylab = "")
#2.2
query <- "SELECT salary, from_date FROM salaries WHERE emp_no = 492917 ORDER BY from_date;"
resultSalaryHistoryFROM492917 <- dbSendQuery(dbConnection, query)
dataSalaryHistoryFrom492917 <- fetch(resultSalaryHistoryFROM492917, -1)
plot(1985:2002,dataSalaryHistoryFrom492917$salary, xlab="year", ylab="salary", type="l")
#2.3
query <- "SELECT avg(salary) as average_salary, YEAR(from_date) as year FROM salaries group by YEAR(from_date) order by YEAR(from_date);"
resultAverageSalaryPerYear <- dbSendQuery(dbConnection, query)
dataAverageSalaryPerYear <- fetch(resultAverageSalaryPerYear, -1)
#2.3.1
years= dataAverageSalaryPerYear$year
salaries = as.numeric(dataAverageSalaryPerYear$average_salary)
lmAverageSalaryPerYear <- lm(salaries~years)
plot(years, salaries, xlim= c(1985, 2030), ylim=c(50000,100000));
abline(lmAverageSalaryPerYear, col="red")
#2.3.2
predictAverageSalaryPerYear <- predict(lmAverageSalaryPerYear, data.frame(years=(2020:2030)))
points(2020:2030, predictAverageSalaryPerYear, col="blue")
#2.4
query <- "SELECT (year(now())-year(e.birth_date)) as age, avg(s.salary) FROM employees e INNER JOIN salaries s ON e.emp_no = s.emp_no GROUP BY age ORDER BY age;"
resultCorrelation <- dbSendQuery(dbConnection, query)
dataCorrelation <- fetch(resultCorrelation, -1)
cor = cor.test(dataCorrelation$age,dataCorrelation$`avg(s.salary)`)
cor # 0.3420241

