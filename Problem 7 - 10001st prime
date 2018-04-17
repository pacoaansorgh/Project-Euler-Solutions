// Find the Xth prime number, in this case 10001
#include <iostream>
#define TARGET 10001

using namespace std;

int main() {
    int count = 0;
    int num = 1;
    while (count < TARGET) {
        num++;
        bool prime = true;
        // Check if the number is a prime number by looking for a divisor. If we find one it is not a prime.
        // Possible optimization is to check against only previous primes.
        for (int divider = 2; divider < num; divider++) {
            if (num % divider == 0) {
                prime = false;
                break;
            }
        }
        // If it is a prime, add one to our prime count.
        if (prime){
            count++;
        }
    }
    cout<<"The "<<TARGET<< "th prime is: "<<num;
    return 0;
}
