// Find the value of the first triangle number to have over 500 divisors.
#include <iostream>
#include <cmath>
#define DIVISORS 500

using namespace std;

int main()
{
    int counter = DIVISORS;
    long long triangle = 0;
    // Set up our first triangle number.
    for (int i = 1; i <= counter; i++){
        triangle += i;
    }
    while(true){
        // Every number is divisible by 1, so we skip that.
        int divisors = 1;
        // Only check up to the square root of the number.
        int triangleSqrt = sqrt(triangle);
        for (int i = 2; i <= triangleSqrt; i++){
            if (triangle % i == 0){
                divisors++;
                // Unless the number was exactly the square root, its counterpart is also a divisor (e.g. 15 / 3 = 5, so 3 and 5 are divisors)
                if (i*i != triangle){
                    divisors++;
                }
            }
        }
        if (divisors > DIVISORS){
            cout<<"The value of the first triangle number with over "<<DIVISORS<<" divisors is: "<<triangle;
            break;
        }
        // Update the number we are at, and compute the next triangle number.
        counter++;
        triangle += counter;
    }
    return 0;
}
