// Find the difference between sum of squares and square of sums of numbers 1-100
#include <iostream>
/* Limit set to 100 for this problem. 
Note that if we set it higher we may hit the limit of an integer.
To prevent this issue we could switch from using integers to long longs.*/
#define LIMIT 100

using namespace std;

int main() {
    int difference = 0;
    int sum = 0;
    int sumofsquares = 0;
    // Add the number to the sums to square later, and add the square to the sumofsquares.
    for (int i = 1; i <= LIMIT; i++){
        sum += i;
        sumofsquares += (i*i);
    }
    // Square all the sums to get the square of sums.
    int squareofsums = sum * sum;
    // Get the difference between the two. Since square of sums will always be bigger we put that one first.
    // A safety check would be to get the absolute value of the difference between the two, so it doesn't matter what order you subtract in.
    difference = squareofsums - sumofsquares;
    cout<<"Difference between sum of squares and square of sums is: "<<difference;
    return 0;
}
