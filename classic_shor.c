#include <stdio.h>
#include <stdlib.h>
#include <time.h>

//ASM x86 function
extern int gcd(int N, int a ); 

unsigned long long N = 194;
unsigned long long p = 1;
unsigned long long q = 1;
unsigned long long pre_r = 0;

unsigned long long a = 0;

// Russian Peasant Multiplication
unsigned long long mod_mul(unsigned long long a, unsigned long long r, unsigned long long mod)
{
    unsigned long long res = 0;
    a = a % mod;

    while (r > 0)
    {
        if (r & 1)
        {
            res = (res + a) % mod;       
        }
        a = (a * 2) % mod;
        r >>= 1;
    }
    return res;
}

unsigned long long modular_pow(unsigned long long base, unsigned long long period, unsigned long long mod)
{
    unsigned long long result = 1;
    base = base % mod;

    while (period > 0)
    {
        if  (period & 1)
        {
            result = mod_mul(result, base, mod);
        }
        base = mod_mul(base, base, mod);
        period >>= 1;
    }
    return result;
}

unsigned long long factorize(unsigned long long N, unsigned long long p, unsigned long long q)
{
    while (p == 1 || q == 1)
    {
        
        a = rand() % (N - 2) + 2;

        while (gcd((int)N, (int)a) != 1)
        {      
            a = rand() % (N - 2) + 2;
        }
      
        for (int r = 1; r < N + 1; r++)
        {
            if (modular_pow(a, r, N) == 1)
            {
                pre_r = r;

                break;
            }
        }  
        p = 2;
        q = 2;
    }
    
    return (int)pre_r;
}

int main(void)
{
    srand(time(NULL));

    int result = factorize(N, p, q);
    printf("%d and %d",result, a);

    return 0;
}

