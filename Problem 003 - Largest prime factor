// Find the largest prime factor of 600851475143
#include <iostream>
#define TARGET 600851475143

using namespace std;

int main() {
    long long largest = 0;
    // Our target number. Since we modify this number We have to create a variable for it.
    long long target = TARGET;
    for (int i = 1; i <= target; i++) {
        // Check if our target number is divisible by our current number.
        if (target % i == 0){
            // If so, check if the current number is the largest divisor we've found so far.
            if (i > largest){
                largest = i;
            }
            // Then divide our target by that divisor and reset our divisor counter.
            target /= i;
            i = 1;
        }
    }
    cout<<"The largest prime factor of "<<TARGET<<" is: "<<largest;
    return 0;
}
