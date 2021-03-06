// Find largest palindrome product of two 3-digit numbers.
#include <iostream>

using namespace std;

int main() {
    int largest = 0;
    // Our two numbers range from 100 to 999, since those are the only 3-digit numbers.
    for (int i = 100; i < 1000; i++){
        for (int j = 100; j < 1000; j++){
            int product = i*j;
            // Check if the product is the largest we've found so far first.
            if (product > largest) {
                // Now we reverse the product to see if it is a palindrome.
                int reverse = 0;
                int temp = product;
                while (temp != 0){
                    // Remainder division by 10 leaves only the last digit.
                    int digit = temp % 10;
                    reverse *= 10;
                    reverse += digit;
                    temp -= digit;
                    temp /= 10;
                }
                // If our product and its reverse are the same it's a palindrome.
                if (product == reverse) {
                    largest = product;
                }
            }
        }
    }
    cout<<"Largest palindrome product of two 3-digit numbers is: "<<largest;
    return 0;
}
