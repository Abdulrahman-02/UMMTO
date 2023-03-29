# simplexe : Résoudre un problème canonique
# --------------------------------
# numpy == est une bibliothèque open source Python pour manipuler des matrices 
# ou tableaux multidimensionnels ainsi des fonctions mathématiques opérant sur ces tableaux.
# --------------------------------

import sys
import numpy as np

print('\n')
print('====================================================')
print("  Programmation de l'algotithme de Simplexe Python  ")
print('====================================================')
print('\n')


# convertir les formules en vecteur 
def conv(form,var) :
    f = []
    tst = False
    ops = ['=','>','<','<=','>=']
    for op in ops :
        if op not in form :
            pass
        else :
            f.append(int(form.split(op)[1]))
            form = form.split(op)[0]
            tst = True
            break
    if tst == False :
        f.append(0)
    for v in var :
        if v in form :
            s_form = form.split(v)
            if s_form[0] in ['','+','-'] :
                f.append(int(s_form[0]+'1'))
            else :
                f.append(int(s_form[0]))
            form = s_form[1]
        else :
            f.append(0)
    return f

# supprimer les espaces
def removeChar(ch,char=' '):
    n_ch =''
    for i in ch :
        if i == char :
              pass
        else :
            n_ch += i
    return n_ch

# matrice de simplex
def simplex_mat(pb,var) :
    mat = []
    j = -1
    for l in pb :
        line = conv(l,var)
        for i in range(len(pb)-1) :
            if i == j :
                if '>=' in l :
                    line.append(-1)
                elif '<=' in l :
                    line.append(1)
            else :
                line.append(0)
        mat.append(line.copy())
        j = j + 1
    return mat

# Rechercher la ligne pivot
def getLinePivot(mat,c,h) :
    cb = []
    for i in h :
        l = mat[i]
        if l[c] == 0 or l[0] == 0 :
            cb.append(0)
        else :
            cb.append(abs(l[0]/l[c]))
    n_cb = set(cb)
    try :
        n_cb.remove(0)
    except :
        pass
    return cb.index(min(n_cb))+1

# Rechercher la colonne pivot
def getColPivot(mat) :
    if isMin == False :
        return mat[0].index(max(mat[0]))
    else :
        n_v = set(mat[0])
        try :
            n_v.remove(0)
        except :
            pass
        return mat[0].index(min(n_v))

# convertir le programme de minimisation
def ToMin(mat) :
    for i in range(1,len(mat)) :
        for j in mat[i] :
            j *= -1
    return mat

# copier les element de la matrice 
def matcopy(mat) :
    mat0 = []
    for i in mat :
        mat0.append(i.copy())
    return mat0
mat = []

#debut de la saisie des donnee 
prblm = input('Max ou Min\n > ')
if 'min' not in prblm and 'max' not in prblm :
    print('La nature de problème est incorrecte ')
    sys.exit()

varDec = input('Variables de décisions séparés par une virgule(,) exemple:x1,x2,...\n > ')
varDec = varDec.split(',')
if len(varDec) == 1 :
    print('Nombre de variables insuffisant')
    sys.exit()

if 'max' in prblm :
    isMin = False
    funcObj = input('Fonction Objectif\n> max z = ')
elif 'min' in prblm :
    isMin = True
    funcObj = input('Fonction Objectif\n> min z =')

mat.append(removeChar(funcObj))
cont = input('Contraintes avec la dernière ";" \n> ')
mat.append(removeChar(cont).strip(';'))

while ';' not in cont :
    	cont = input('\n>') 
    	mat.append(removeChar(cont).strip(';'))

if len(mat) < len(varDec) :
    print('Solution infini ou introuvable ')
    sys.exit()

#tester le point 0 est dans le dsr
def dsrTst(matrix) :
    for i in range(1,len(matrix)) :
        if matrix[i][(len(varDec)+i)] == 1 :
            if matrix[i][0] > 0 :
                return False
        else :
            if matrix[i][0] < 0 :
                return False        
    return True
mat = simplex_mat(mat,varDec)

h_base = list(range(1,len(mat)))
it = 1

#l'affichage de premier tableau
for l in mat :
    print(l)
res = {}
mat0 = matcopy(mat)
if dsrTst == False :
    print('Le point 0 n\'est pas inclus dans le DSR')
    sys.exit()
if isMin == True :
    mat = ToMin(mat)

# Simplexe 
while mat[0][getColPivot(mat)] > 0 :
    col = getColPivot(mat)
    lin = getLinePivot(mat,col,h_base) 
  
    pivot = mat[lin][col]
    for i in range(len(mat)) :
        for j in range(len(mat[i])) :
            if j == col :
                if i == lin :
                    pass
                else :
                    mat[i][col] = 0
            elif i == lin :
                mat[i][j] /= pivot
            else :
                mat[i][j] -= (mat0[lin][j] * mat0[i][col]) / pivot
    
    res[varDec[col-1]] = lin
    h_base.remove(lin)
    print('le tableau {}\n'.format(it))
    it += 1
    for l in mat :
        print(l)
    mat0 = matcopy(mat)

# Résultat 
for varDec in res :
    index = res[varDec]
    print('{} = {}'.format(varDec,mat[index][0]))
print('optimum = {}'.format(abs(mat[0][0])))