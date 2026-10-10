import random
import math

N = 91
p = 1
q = 1

while p == 1 or q == 1:
    a = random.randint(2, N - 1)  
    while math.gcd(N, a) != 1:    # call euclidean_algorithm asmx86
        a = random.randint(2, N - 1)

    r = 0
    for pre_r in range(1, N + 1):   
        if (a**pre_r % N) == 1: # Overflow!
            r = pre_r
            break
    
    if r % 2 != 0:
        continue

    pre_p = int(a**(r/2) + 1)
    
    if pre_p % N == 0:
        continue

    p = math.gcd(pre_p, N) # call euclidean_algorithm asmx86 | Overflow!
    q = math.gcd(int(a**(r/2) - 1), N) # call euclidean_algorithm asmx86 | Overflow!


print(p,q)