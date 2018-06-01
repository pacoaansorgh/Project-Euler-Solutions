/*
Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; 
therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
*/

#include <iostream>
#define LIMIT 10000

using namespace std;

int main()
{
    // Create the array with one extra entry, since we want to store in 1 - LIMIT, rather than 0 - (LIMIT-1)
    int sums[LIMIT + 1] = {0};
    for (int i = 1; i <= LIMIT; i++){
        int sum = 0;
        for (int d = 1; d < i; d++){
            if (i%d == 0){
                sum += d;
            }
        }
        sums[i] = sum;
    }
    int totalsum = 0;
    for (int i = 1; i <= LIMIT; i++){
        //Make sure we only count numbers under our limit, as well as array safety.
        if (sums[i] <= LIMIT){
            // If the sum of the divisors of the sum of our divisors equals the initial number, but the sum of our divisors is not the same as our initial number:
            if (sums[sums[i]] == i && sums[i] != i){
                // The number is an amicable number, so add it to the total sum.
                totalsum += i;
            }
        }
    }
    cout<<"The total sum of all amicable numbers under "<<LIMIT<<" is: "<<totalsum;
    return 0;
}
