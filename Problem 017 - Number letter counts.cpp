// Find the total number of letters used to write out the numbers 1-1000 (inclusive) using the english language.
#include <iostream>
#define LIMIT 1000

using namespace std;

int main()
{
    // Our data for what words contain how many letters.
    int zerototwenty[21] =   {4, 3, 3, 5, 4, 4, 3, 5, 5, 4, 3, 6, 6, 8, 8, 7, 7, 9, 8, 8, 6};
    int tenners[10] = {0, 3, 6, 6, 5, 5, 5, 7, 6, 6};
    int combiner = 3;
    int hundred = 7;
    int thousand = 8;
    // Our letter count
    int nr_of_letters = 0;
    for (int i = 1; i <= LIMIT; i++){
        // If our number has a thousand in it:
        if (i / 1000 > 0){
            nr_of_letters += zerototwenty[i/1000];
            nr_of_letters += thousand;
        }
        // If our number has a 100 in it:
        if ((i%1000) / 100 > 0){
            nr_of_letters += zerototwenty[i/100];
            nr_of_letters += hundred;
            if (i % 100 != 0){nr_of_letters += combiner;}
        }
        // If our number has value in the tens digit, but is not one of the unique 11-19 numbers:
        if ((i%100) > 20){
            nr_of_letters += tenners[(i%100) / 10];
            if (i%10 != 0){nr_of_letters += zerototwenty[i%10];}
        }
        // If our number has a value in the final two digits, below 20 and not 0:
        else if ((i%100) <= 20 && (i%100) != 0){
            nr_of_letters += zerototwenty[i%100];
        }
    }
    cout<<"The total number of letters in the numbers 1 to "<<LIMIT<<" inclusive is: "<<nr_of_letters;
    return 0;
}
