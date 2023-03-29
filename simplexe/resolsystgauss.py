import numpy as np

import time as time


print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
print('%%%%%%%%%%%%   Programmation de l''algorithme de Gauss         %%%%%%%%%%%%%%%%')
print('%%%%%%%%%%   par PYTHON pour n''importe quelle matrice carrée    %%%%%%%%%%%%%%')
print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
print('  ')
print('---------------------------')
print('----  Initialisation  -----')
print('---------------------------')

# recupérer les colonnes
def get_column(x,B):

  a = [(B[i][x]) for i in range(n)]
  return a

# valeurs absolus
def absolute(B):

  for i in range(n):
    B[i]=abs(B[i])
  return B

t = time.time()

# Déclaration de la taille de la matrice A, les éléments seront injectés un par un

size=input('Donner la taille de la matrice: \n')
n=int(size)
A = [([0]*n) for i in range(n)]
for i in range(n):
  for k in range(n):
    valeur = int(input('Donner la valeur de A['+ str(i) +','+ str(k) +']: \n'))
    A[i][k]=valeur

a=A
B=A

for k in range(n-1):
  print('<><><><><><><><><><><><>')
  print('     Etape',str(k))
  print('<><><><><><><><><><><><>')
  if B[k][k] == 0:
    # if B(k,k)==0 ||  abs(B(k,k))<=1 %activer la méthode du pivot partiel pour les petite valeur  
    # if B(k,k)==0 || % abs(B(k,k))<=1 %activer la méthode du pivot partiel pour les petite valeur

    index=np.argmax(get_column(k,B))
    maximum = max(absolute(get_column(k,B)))
    L1=B[k]
    L2=B[index]
    B[k]=L2
    B[index]=L1


  i=k+1
  while (i < n):

    s=(B[i][k])/(B[k][k])
    j=k

    while j < n:

      B[i][j]=(B[i][j]) - s * (B[k][j])
      j=j+1
    i=i+1
  print('  ')
  print('----> La matrice A^(',str(k),') = ',B);  
  print('  ')
  
  elapsed = time.time() - t

print('---------------------------------------')
print('---------- résultat finale ------------')
print('---------------------------------------')
print('  ')
print('La matrice de triangularisation de A = ', a ,' par la méthode de Gauss est T = ',B)
print('le temps de calcul est de ',elapsed,' secondes')
print('  ')