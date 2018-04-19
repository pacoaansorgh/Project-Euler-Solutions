// Find the sum of the digits of 2^1000
#include <iostream>
#include <vector>

#define POWER 1000

using namespace std;


int main()
{
    // Keep a vector to store the digits in since this number will be too big to store normally.
    vector<int> digits = {1};
    for (int i = 0; i < POWER; i++){
        // We start doubling our digits at the back of the vector (biggest digit first)
        for (int j = digits.size() - 1; j >= 0; j--){
            // We double the value, then check if it has become bigger than 10.
            int newval = digits.at(j) * 2;
            if (newval >= 10){
                // If it is bigger than 10, we remove the new digit and either:
                newval %= 10;
                // Add 1 to the next digit, or:
                if (j < digits.size() - 1){
                    digits.at(j+1) += 1;
                }
                // Create a new digit with value 1 if this was already the biggest.
                else {
                    digits.push_back(1);
                }
            }
            // Remember to store the new digit.
            digits.at(j) = newval;
        }
    }
    // Now sum up the digits.
    int sum = 0;
    for (int i = digits.size() - 1; i >= 0; i--){
        sum += digits.at(i);
    }
    cout<<"The sum of the digits of 2^"<<POWER<<" is: "<<sum;
    return 0;
}
