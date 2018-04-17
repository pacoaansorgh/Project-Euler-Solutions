// Find the sum of all primes below X, in this case 2000000
#include <iostream>
#define LIMIT 2000000

using namespace std;

int main() {
    long long sum = 2;
    int num = 3;
    // Check each number under the limit.
    while (num < LIMIT) {
        bool prime = true;
        // Check if the number is a prime. We could optimize by checking only for divisions against other primes.
        // I decided not to in order to keep the code simple.
        for (int i = 2; i*i <= num; i++) {
            if (num % i == 0){
                prime = false;
                break;
            }
        }
        // If we've found a prime, add it to our total sum.
        if (prime){
            sum += num;
        }
        // Add 2 to the number we're checking so we can skip even numbers, since no prime other than 2 is even.
        num += 2;
    }
    cout<<"The sum of all primes below "<<LIMIT<<" is: "<<sum;
    return 0;
}
