import numpy as np

# La méthode de Gauss consiste à construire 
# une matrice inversible M telle que MA = U soit une matrice triangulaire supérieure

# Le système initiale Au = b est alors équivalent par multiplication à gauche par M 
# inversible au système triangulaire MAu = Mb c'est à dire au système : U.u = bnew,
# de second membre bnew = Mb

# Il suffit donc d'appliquer à ce dernier système la méthode de remontée

print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
print("%%%%%%%%%%%%   Programmation de l'algorithme de Gauss         %%%%%%%%%%%%%%%%")
print("%%%%%%%%%%   avec PYTHON pour n'importe quelle matrice carrée    %%%%%%%%%%%%%%")
print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
print('         ')
print('---------------------------')
print('----  Initialisation  -----')
print('---------------------------')
print('         ')

# recupérer les colonnes
def get_column(x,B):

  a = [(B[i][x]) for i in range(size)]
  return a

# valeurs absolus
def absolute(B):

  for i in range(size):
    B[i]=abs(B[i])
  return B

# ind2sub pour Python
def ind2sub(array_shape, ind):
    rows = (ind.astype('int') / array_shape[1])
    cols = (ind.astype('int') % array_shape[1])
    return (rows, cols)

# Déclaration de la matrice A et la remplire

size = int(input('Donner la taille de la matrice: \n'))
print('         ')
a = []
print('Entrer les valeurs de la matrice')
print('         ')
for i in range(size):          # pour les lignes
    matrix =[]
    for j in range(size):      # pour les colonnes
         matrix.append(int(input("a[" + str(i) + "," + str(j) + "] = ")))
    a.append(matrix)

# afficher la matrice

print('votre matrice a est: ')
print('         ')
for i in range(size):
    for j in range(size):
        print(a[i][j], end = " ")
    print()

# Matrice sous forme algébrique

A = [([0]*size)for i in range(size)]
# for i in range(size):
#     for j in range(size):
#         print(a[i][j], end = " ")
#     print()

for i in range(size):
    for j in range(size):
        A[i][j] = a[i][j]
print('         ')
print('La matrice à réduire par la méthode de Gauss est A = : ')
print('         ')
for i in range(size):
    for j in range(size):
        print(A[i][j], end = " ")
    print()

# choisire la stratigie a utilisé
print('Gauss sans permutation: Entrer 1')
print('Gauss pivot partiel: Entrer 2')
print('Gauss pivot totale: Entrer 3')
print('         ')
methode = int(input('Tapez 1 ou 2 ou 3 \n'))

print('---------------------------------------')
print('------ résultat de chaque étape -------')
print('---------------------------------------')

B = A; #Changement de notation de la matrice de A pour ne pas l'ecraser lors des calculs

# for i in range(size):
#     for j in range(size):
#         print(B[i][j], end = " ")
#     print()

for k in range(size-1):
    print('<><><><><><><><><><><><>')
    print('     Etape',str(k))
    print('<><><><><><><><><><><><>')

# Pivot Totale
if methode == 3:
    index = np.argmax(get_column(B))
    maximum = max(absolute(get_column(B)))
    


# Pivot Partiel
elif methode == 2 | B(k,k) == 0:
    index = np.argmax(get_column(k,B))
    maximum = max(absolute(get_column(k,B)))
    L1=B[k]
    L2=B[index]
    B[k]=L2
    B[index]=L1

    i = k+1
    while(i < size):
        s = B[i][k] / B [k][k]
        j = k
        while(j < size):
            B[i][j] = B[i][j] - s * B[k][j]
            j = j+1
    i = i+1
    print('  ')
    print('----> La matrice A^(',str(k),')= ',B)  
    print('  ')

# Sans permutation
    i = k+1
else:
    while(i < size):
        s=(B[i][k])/(B[k][k])
        j=k
    while(j < size):
        B[i][j]=(B[i][j]) - s * (B[k][j])
        j = j+1
    i = i+1
    print('  ')
    print('----> La matrice A^(',str(k),') = ',B);  
    print('  ')

print('---------------------------------------')
print('---------- résultat finale ------------')
print('---------------------------------------')
print('  ')
print('La matrice de triangularisation de A = ', A ,' par la méthode de Gauss est T = ',B)
print('  ')


