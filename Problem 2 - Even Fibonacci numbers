// Find the sum of all even fibonacci numbers below 4000000
#include <iostream>
#define LIMIT 4000000

using namespace std;

int main(){
	int sum = 0;
	int fib = 1;
	int prev = 1;
	while (fib < LIMIT) {
	    	// Check if the number is even.
		if (fib % 2 == 0) {
		    	// If so, add it to the sum.
			sum += fib;
		}
		// Compute the next fibonacci number.
		int temp = fib;
		fib += prev;
		prev = temp;
	}
	cout<<"The sum is: "<<sum;
	return 0;
}
