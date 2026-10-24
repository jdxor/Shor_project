#include <stdio.h>
#include <stdlib.h>
#include <time.h>

//ASM x86 function
extern int gcd(int N, int a ); 

unsigned long long N = 1;
unsigned long long p = 1;
unsigned long long q = 1;
unsigned long long r = 0;

unsigned long long a = 0;

unsigned long long int_pow(unsigned long long a, unsigned long long exp)
{
    unsigned long long result = 1;
    
    while (exp > 0)
    {
        result *=a;
        exp--;
    }
    
    return result;
}

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

void factorize(void)
{
    while (p == 1 || q == 1)
    {
        
        a = rand() % (N - 2) + 2;

        while (gcd((int)N, (int)a) != 1)
        {      
            a = rand() % (N - 2) + 2;
        }
      
        for (unsigned long long pre_r = 1; pre_r < N + 1; pre_r++)
        {
            if (modular_pow(a, pre_r, N) == 1)
            {
                r = pre_r;

                break;
            }
        }
   
        if (r % 2 != 0)
        {
            continue;
        }

        int pre_p  = int_pow(a, r/2) + 1;
        
        if (pre_p % N == 0)
        {
            continue;
        }
        
        p = gcd(pre_p, N);
        
        int pre_q  = int_pow(a, r/2) - 1;
        q = gcd(pre_q, N);  
    
    }
    
}

int main(void)
{
    srand(time(NULL));

    printf("Write a odd square-free semiprime number: ");
    scanf("%llu", &N);
    factorize();
    printf("%llu and %llu",p, q);

    return 0;
}

