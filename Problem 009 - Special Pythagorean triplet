// Find the product for the pythagorean triplet* for which A+B+C == 1000
// *a pythagorean triplet is a set of three natural numbers A < B < C for which A^2 + B^2 == C^2
#include <iostream>

using namespace std;

int main() {
    int product = 0;
    // A has to be smaller than both B and C, which means it is 333 at most.
    for (int a = 1; a < 334; a++) {
        // B has to be bigger than A, and smaller than C, which means it is 499 at most.
        for (int b = a + 1; b < 500; b++) {
            // The total has to add up to 1000, so C is 1000-(A+B).
            int c = 1000-(a+b);
            // Check if the squares add up to A^2 + B^2 == C^2.
            if ((a*a)+(b*b)==(c*c)) {
                cout<<"a = "<<a<<"\n";
                cout<<"b = "<<b<<"\n";
                cout<<"c = "<<c<<"\n";
                product = a*b*c;
                cout<<"product = "<<product<<"\n";
            }
        }
    }
    return 0;
}
