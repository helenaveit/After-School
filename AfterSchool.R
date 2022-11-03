setwd("/Users/helenaveit/Documents/Studium/5. Semester/Anfänger Praktikum/AnfängerPraktikum")

#Datensatz laden:
install.packages("haven")
library (haven)
daten_all <- read_sav("endgültiger Datensatz ohne Stillen.sav")

#Daten aufbereiten:
is.data.frame(daten_all)
#Datensatz ist als dataframe gespeichert

#Plausibilitäts-Check:
#Im folgenden checke ich alle Variablen auf die auftretenden Ausprägungen:
sapply(sapply(daten_all, unique), sort, na.last=TRUE)

#Dann verschaffe ich mich einen Überblick über die Verteilung der Daten:
summary(daten_all)
ls.str(daten_all)

#Im folgenden schaue ich, wieviel 'NA' Werte in den verschiedenen Variablen auftreten:
colSums(is.na(daten_all))
#Bei den Retrospektiv Befragten fehlen die Werte für alle Variablem im 
# Zusammenhang mit 'Präpartalen Ängsten','Postpartale Gesundheitszustand', '
# 'EPDS präpartal' sowie 'EDPS 1m'
#Bei den restlichen Daten wird davon ausgegeangen, dass keine systematisches
# fehlen von Daten auftritt.

#Jetzt teile ich den Datensatz auf in zwei Unterkategorien: 
# Prospektiv Befragte und Retrospektiv Befragte

daten_pro <- daten_all[grepl('Pat', daten_all$Patientennummer),]
daten_retro <- daten_all[grepl('Retro', daten_all$Patientennummer),]



