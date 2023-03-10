import pandas as pd
from matplotlib import pyplot as plt

# Einlesen des Datensatzes
df = pd.read_csv('european_social_survey/ESS8e02.1_F1.csv', sep=",")

# print(df.describe())
print("Columns:", df.columns.values)
print("Nr. Entries:", len(df))

print(df.gndr.value_counts)  # 1...Male 2...Female, 9...No Answer

# Umkodieren der Zahlenwerte zu Kategorien
df['gndr'] = pd.cut(df['gndr'], [0, 1, 2, 9], labels=['Male', 'Female', 'No Answer'])
# Zur Überprüfung checken ob die gleiche Anzahl rauskommt wie oben
print(df.gndr.value_counts())

# Grafische Darstellung davon
df['gndr'].value_counts().plot(kind='bar')
plt.show()

# Auswahl von einer Gruppe
df_f = df.loc[df['gndr'] == 'Female']
print(df_f.head().gndr)

# Darstellung von Häufigkeiten
gndr_cntry = pd.crosstab(df['gndr'], df['cntry'])
# in Pycharm: Variablenansicht. Rechte Maustaste auf Variable => Vie as DataFrame liefert eine bessere Anzeige
print(gndr_cntry)
print(df['cntry'])

# Test

print(df[df['gndr'] == 'Male'][['trstplc', 'gndr']])

# TODO: Männer haben mehr Glauben in die Polizei (trstplc, gender)
# Ordinalskala, da mit h
df_male_trust_into_police = df[df['gndr'] == 'Male'].trstplc
df_female_trust_into_police = df[df['gndr'] == 'Female'].trstplc
df_trust_into_police_ordered_by_gender = None

df_male_trust_into_police.plot()
df_female_trust_into_police.plot()
plt.show()

# TODO: Es besteht ein negativer Zusammenhang bei "mehr Strom aus nuklearer Energie" und
#       "mehr Strom aus Solarenergie" (elgnuc, elgsun)

# TODO: In Österreich ist der Eindruck, dass sich der Klimawandel schlecht auf die Menschen auswirkt,
#       stärker als in Ungarn (ccgdbd)

# TODO: Frauen stimmen einem bedingungslosen Grundeinkommen eher zu (basinc)

# TODO:

# TODO:
