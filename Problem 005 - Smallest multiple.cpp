/* 
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
*/
#include <iostream>
#define DIVISORS 20

using namespace std;

int main(){
    int num = 2;
    // This variable could be cut to save some memory, but it improves code clarity.
    bool found = false;
    while (!found) {
        bool divisible = true;
        // Check the numer against all divisors. If we find one that fails, go to the next number.
        for (int i = DIVISORS; i >= 2; i--) {
            if (num % i != 0) {
                divisible = false;
                break;
            }
        }
        // If all divisors passed we've found the first (and smallest) number, so we stop.
        if (divisible) {
            break;
        }
        num += 2;   
    }
    cout<<"Smallest number evenly divisible by 1 through "<<DIVISORS<<" is: "<<num;
    return 0;
}

/*
Some notes on optimization:
We could speed up execution a lot by skipping over unnecessary numbers. However, this would limit the flexibility of the program.
With the specific target divisors up to 20, we could:
start looking at 2640, the first number after 2520 that is divisible by both 11 and 20.
increment in steps of 220 rather than 2. This way we skip all numbers not divisible by both 11 and 20.
We could stop checking divisors below 11, since we've checked their doubles already.

All of those would speed up the program a lot, but would require specific adaptation to the target divisor limit of 20.
For an example of the optimized, targetted version of this, look at the LUA code sample of this same problem.
*/
