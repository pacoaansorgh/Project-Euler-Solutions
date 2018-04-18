// Smallest number evenly divisible by all numbers from 1 to 20
#include <iostream>
#define DIVISORS 20

using namespace std;

int main(){
    int num = 1;
    // This variable could be cut to save some memory, but it improves code clarity.
    bool found = false;
    while (!found) {
        bool divisible = true;
        // Check the numer against all divisors. If we find one that fails, go to the next number.
        for (int i = 1; i <= DIVISORS; i++) {
            if (num % i != 0) {
                divisible = false;
                break;
            }
        }
        // If all divisors passed we've found the first (and smallest) number, so we stop.
        if (divisible) {
            break;
        }
        num += 1;   
    }
    cout<<"Smallest number evenly divisible by 1 through "<<DIVISORS<<" is: "<<num;
	return 0;
}
