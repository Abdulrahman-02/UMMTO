from random import randrange
# 
# generate a list of random numbers


def generate_list(min=0, max=10, count=20):
    numList = []
    for i in range(0, count):
        n = randrange(min, max)
        numList.append(n)
    return numList


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


# generate a list of dicts
def generate_dict(list=[]):
    myUniq = unique(list)
    myDup = get_duplicates(list)
    myL = []

    for i in myUniq:
        dict = {
            'number': i,
            'string': str(i),
            'even': (i % 2 == 0),
            'duplicated': i in myDup
        }
        myL.append(dict)
    return myL
