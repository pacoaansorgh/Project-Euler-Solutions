/*
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. 
For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. 
By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. 
However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as 
the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
*/

#include <iostream>
#include <vector>

#define LIMIT 28123

using namespace std;


int main()
{
	vector<int> abundants;
	// Find all abundant numbers below the given limit
	for (int i = 1; i <= LIMIT; i++) {
		int total = 0;
		for (int divisor = 1; divisor < (i / 2) + 1; divisor++) {
			if (i % divisor == 0) {
				total += divisor;
			}
		}
		if (total > i) {
			abundants.push_back(i);
		}
	}
	cout << "There are " << abundants.size() << " abundant numbers below " << LIMIT << endl;
	int total = 0;
	int composites[LIMIT+1] = { 0 };
	int vecsize = abundants.size();
	// For every abundant number below half our limit:
	for (int i = 0; i < vecsize && abundants[i] <= (LIMIT/2); i++) {
		// See if it can combine with another abundant number, equal to or higher than itself, to form a composite number
		int ival = abundants[i];
		for (int k = i; k < vecsize; k++) {
			int temp = ival + abundants[k];
			// Then see if that composite number is below our limit still:
			if (temp <= LIMIT) {
				// And if so, we remember the resulting number. Note that this will give duplicates.
				composites[temp] = temp;
			}
			else if (temp > LIMIT) {
				break;
			}
		}
	}
	for (int i = 1; i <= LIMIT; i++) {
		total += i - composites[i];
	}
	cout << "The sum of all the positive integers which cannot be written as the sum of two abundant numbers is: " << total<<endl;
	return 0;
}
