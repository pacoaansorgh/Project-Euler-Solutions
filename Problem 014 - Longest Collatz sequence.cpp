// Find the number with the longest collatz sequence under 1000000.
#include <iostream>
#include <vector>
#define LIMIT 1000000

using namespace std;

int main(){
    // The current number we're working with
    long long number = 0;
    // The longest chain we've found so far
    int largestChain = 0;
    // The number that caused the longest chain we've found so far
    int largestNumber = 0;
    // Previous chains. Keep this to shorten future searches.
    vector<int> collatz = {0, 1, 2};
    for (int i = 3; i < LIMIT; i++){
        number = i;
        int chain = 0;
        // keep looping until we hit our target.
        while (number != 1){
            // If it is even, divide it by 2.
            if (number % 2 == 0){
                number /= 2;
            }
            // if it is odd, multiply by 3 then add 1.
            else {
                number = ((number * 3) + 1);
            }
            // Lengthen the chain by 1.
            chain++;
            // If we've hit a number we've had before we should already know how long that number's chain was. Add that to our current chain, then stop.
            if (number < i){
                chain += collatz.at(number);
                if (chain > largestChain){
                    largestChain = chain;
                    largestNumber = i;
                }
                // And remember how long the chain for this number was to shorten future computations.
                collatz.push_back(chain);
                break;
            }
        }
    }
    cout<<"The number under "<<LIMIT<<" with the largest chain is: "<<largestNumber<<" at "<<largestChain<<" long.";
    return 0;
}
