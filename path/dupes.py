import os

l = os.listdir()

s = set(l)

for i in l:
    if i in s:
        s.remove(i)
    else:
        os.remove(i)

