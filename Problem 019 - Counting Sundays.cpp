// How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
/* given:
1 Jan 1900 was a Monday.
Thirty days has September,
April, June and November.
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.
A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
*/

#include <iostream>

using namespace std;

int monthsizes[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

int main()
{
    // Total = number of specified days, year = current year, day = current day of the week, date = current day of the month, month = month of the year.
    int total = 0;
    int year = 1900;
    int day = 1;
    int date = 1;
    int month = 1;
    while (year < 2001){
        // If it is a sunday on the first day of the month:
        if (year > 1900 && day == 7 && date == 1) {total++;}
        day = (day%7) + 1;
        date += 1;
        // If are entering a new month:
        if (date > monthsizes[month-1]){
            // If the month was the last month of the year:
            if (month == 12){
                year += 1;
                month = 1;
                // If we are entering a leap year:
                if (year % 4 == 0 && (!year%100 == 0 || year%400 == 0)) {monthsizes[1] = 29;}
                else {monthsizes[1] = 28;}
            }
            else {month += 1;}
            date = 1;
        }
    }
    cout<<"The number of sundays on the first of the month during the twentieth century was: "<<total;
    return 0;
}
