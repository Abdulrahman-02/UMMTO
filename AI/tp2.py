# importing librairies
# pandas: manipulation et analyse de données pour ML et AI 
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


# =========================== Partie1 ===============================
# read csv file
df = pd.read_csv("Iris.csv")
# show dataframe
print("L'entếte de ce jeux de données est:\n\n ",df.head())
# creating two variables to store attributes
X = df.iloc[:, 1:5]
Y = df.iloc[:, 5]
print("\n L'entête de X: \n\n", X.head())
print("\n L'entête de Y: \n\n", Y.head(10))

# =========================== Partie2 ===============================
# stocker les valeur unique de les classes existantes
uniY = np.unique(Y)
# afficher les classes
print(uniY)
# créer la figure
plt.figure(figsize=(10, 6))
# recevoir les data dans un objet axe 
axe = plt.subplot()
# colonnes de la longeur et largeur
xCol = 0
yCol = 2
# définir des labels pour chaque axes
axe.set_xlabel(X.columns.values[xCol])
axe.set_ylabel(X.columns.values[yCol])
# dessiner le nuage

plt.scatter(X[Y == uniY[0]].iloc[:, xCol], X[Y == uniY[0]].iloc[:, yCol], label=uniY[0])
plt.scatter(X[Y == uniY[1]].iloc[:, xCol], X[Y == uniY[1]].iloc[:, yCol], label=uniY[1])
plt.scatter(X[Y == uniY[2]].iloc[:, xCol], X[Y == uniY[2]].iloc[:, yCol], label=uniY[2])
# afficher une légende
plt.legend()
# show figure
# plt.show()

# =========================== Partie3 ===============================
# importer la fonction
from sklearn.model_selection import train_test_split

# qst1 Division du jeu de données 70% tain 30% test
x_train, x_test, y_train, y_test = train_test_split(X, Y, test_size=0.3, random_state=7)

# afficher la shape de vos nouvelles données
print("X_train shape: ", x_train.shape)
print("X_test shape : ", x_test.shape)
print("y_train shape:", y_train.shape)
print("y_test shape:", y_test.shape)

# qst2 entrainer le modèle
from sklearn.neighbors import KNeighborsClassifier

# entrainement avec le modèle KNN
knn = KNeighborsClassifier(n_neighbors = 3)

knn.fit(x_train, y_train)

# qst3 évaluation du modèle

from sklearn import metrics

y_pred = knn.predict(x_test)

print("Accuracy KNN:", metrics.accuracy_score(y_test, y_pred))

# qst4 faire une prédiction sur un anouveau jeu de données

sample = [[5,5,3,2],[2,4,3,5]]

pred = knn.predict(sample)
print("Prédictions:", pred)

# =========================== Partie4 ===============================
from sklearn.ensemble import RandomForestClassifier
# initialiser le modèle
# max_depth: la profondeur maximale d'un arbre de décision
# random_state: nombre aléatoire
rfc = RandomForestClassifier(max_depth = 2, random_state = 4)
# entrainement grace à la méthode fit
rfc.fit(x_train, y_train)
# évaluation grace à la méthode predict
y_pred = rfc.predict(x_test)
# afficher l'accuracy
print("Accuracy RFC:", metrics.accuracy_score(y_test, y_pred))

# ================== Réseaux de neuronnes ====================
# ML: permettre a les machine d'apprendre grace à des données (exemples)
from sklearn.neural_network import MLPClassifier
# hidden le nombre et les caractéristique de chaque couches cachés
# solver peut prendre 3 valeurs : ibfgs sgb adam 
# parametres d'optimisation du poids
# alpha: pénalités, eviter le reajustement
# random_state: fixé les nombres aléatoires
# max_iter: maximum des itération   
clf=MLPClassifier(solver = 'adam', alpha = 1e-5, hidden_layer_sizes = (5, 5), max_iter = 2000,random_state = 1)
# entrainement
clf.fit(x_train, y_train)
# évaluation
y_pred=clf.predict(x_test)

print("Accuracy MLP:", metrics.accuracy_score(y_test, y_pred))


