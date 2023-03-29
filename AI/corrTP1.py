from random import randrange
import numpy as np
import matplotlib.pyplot as plt

# Partie 1: déclaration de fonctions
# ##################################################


def generate_list(min=0, max=10, count=20):
    l = []
    while count > 0:
        l.append(randrange(min, max))
        count = count - 1
    return l


def unique(l):
    return set(l)


def get_duplicates(l):
    u = unique(l)
    res = set()
    for v in l:
        if v in u:
            u.remove(v)
        else:
            res.add(v)
    return res

# Partie 1: Tests
# ##################################################
print('Partie 1')
ma_liste = generate_list()
print('liste aléatoire: ' + str(ma_liste))
nombres_uniques = unique(ma_liste)
print('unique(): ' + str(nombres_uniques))
nombres_dupliques = get_duplicates(ma_liste)
print('get_duplicate(): ' + str(nombres_dupliques))

# Partie 2: déclaration de fonctions
# ##################################################


def generate_dict(l):
    uniq = unique(l)
    dup = get_duplicates(l)
    res = []
    for v in uniq:
        d = {
            'number': v,
            'string': str(v),
            'even': (v % 2 == 0),
            'duplicated': v in dup,
        }
        res.append(d)
    return res


def count_odd_duplicated(dict_list):
    count = 0
    for d in dict_list:
        if not d['even'] and d['duplicated']:
            count = count + 1
    return count

# Partie 2: tests
# ##################################################
print('Partie 2')
liste_de_dictionnaires = generate_dict(ma_liste)
print("liste de dictionnaires: " + str(liste_de_dictionnaires))
nombre_impairs_dupliques = count_odd_duplicated(liste_de_dictionnaires)
print("Nombre d'élements impairs et dupliqués: " + str(nombre_impairs_dupliques))

# Partie 3: numpy
# ##################################################
print('Partie 3: numpy')
liste1 = generate_list(0, 100, 15)
liste2 = generate_list(0, 100, 15)

arr1 = np.array(liste1)
arr2 = np.array(liste2)
print('arr1=' + str(arr1))
print('arr2=' + str(arr2))
somme = np.add(arr1, arr2)
print('Somme=' + str(somme))
mat1 = np.tile(arr1, (10, 1))
print('Dimension de arr1: ' + str(arr1.shape))
print('Dimension de mat1: ' + str(mat1.shape))
print('Mat1:')
print(mat1)
prod = np.matmul(mat1, arr2)
print('Dimension du produit: ' + str(prod.shape))
print('Produit: ' + str(prod))

# Partie 4: matplotlib
# ##################################################
arr1.sort()
fig, axe = plt.subplots()
fig.suptitle('Ma courbe de nombres aléatoires')

axe.plot(range(0, len(arr1)), arr1)
axe.set_ylabel('Mes valeurs aléatoires')
plt.show()
