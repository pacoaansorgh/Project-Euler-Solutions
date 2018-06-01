// Find the sum of the digits in 100! (one hundred factorial)
#include <iostream>
#include <vector>
#define TARGET 100
using namespace std;

int main()
{
    // Keep track of each digit separately, since the number will be too big to store.
    vector<int> digits = {1};
    // For each multiplication in the factorial number:
    for (int i = 1; i <= TARGET; i++){
        // For each digit we have stored, front to back:
        for (int j = digits.size(); j >= 0; j--){
            // Multiply it by the factorial number
            digits[j] *= i;
        }
        // Now we need to fix the digits that have exceeded 10, so from back to front:
        for (int j = 0; j < digits.size(); j++){
            if (digits[j] >= 10){
                int temp = digits[j];
                int counter = 1;
                digits[j] = temp % 10;
                // If the digit exceeds 10, put the overflow in the next digits, checking for vector size as necessary
                while (temp >= 10){
                temp /= 10;
                if (digits.size() > j+counter){
                    digits[j+counter] += (temp % 10);
                }
                else {
                    digits.push_back((temp % 10));
                }
                counter++;
                }
            }
        }
    }
    int sum = 0;
    // Sum up the digits
    for(int i = digits.size(); i >= 0; i--){
        sum += digits[i];
    }
    cout<<"The sum of the digits of the number "<<TARGET<<"! is: "<<sum;
    return 0;
}
