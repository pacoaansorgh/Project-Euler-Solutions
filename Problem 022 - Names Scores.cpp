/*
Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?

File can be found at:
https://projecteuler.net/problem=22
*/

#include <iostream>
#include <fstream>
#include <vector>
using namespace std;

struct Bucket {
	vector<vector<int>> elements;
	Bucket() {};
	Bucket(vector<vector<int>> e) {
		elements = e;
	}
};

void bucketSort(Bucket bucket, int depth, vector<vector<int>> &target) {
	// Sort the received bucket into new buckets.
	Bucket buckets[27];
	// Check element in bucket.
	for (int i = 0; i < bucket.elements.size(); i++) {
		// If element has no more characters (elements.size() <= depth), add it to the sorted array.
		if (bucket.elements[i].size() <= depth) {
			target.push_back(bucket.elements[i]);
		}
		// If element does have another character add it to its corresponding bucket.
		else {
			buckets[bucket.elements[i][depth]].elements.push_back(bucket.elements[i]);
		}
	}
	// Go through each bucket.
	for (int i = 1; i < 27; i++) {
		// If a bucket has no elements in it, continue to the next one.
		if (buckets[i].elements.size() == 0) { 
			continue; 
		}
		// If a bucket has one element in it, add it to the sorted array.
		else if (buckets[i].elements.size() == 1) { 
			target.push_back(buckets[i].elements[0]); 
		}
		// If a bucket has more than one element in it, recursively call bucketsort on that bucket, increasing depth by 1.
		else {
			bucketSort(buckets[i], depth + 1, target);
		}
	}
}

int main()
{
	ifstream names;
	// Keep a twodimensional vector for character storage.
	vector<vector<char>> namestorage;
	// Open the file (using absolute filepath in this case)
	names.open("C:/Users/Paco/Desktop/names.txt");
	if (names.is_open()) {
		char c;
		vector<char> name;
		// Get each individual character out of the file.
		while (names.get(c)) {
			// Ignoring quotation marks
			if (c == '"') {
				continue;
			}
			// If we hit a comma we've hit the end of a name.
			else if (c == ',') {
				namestorage.push_back(name);
				name.clear();
			}
			// Otherwise, add it to the current name we're checking.
			else {
				name.push_back(c);
			}
		}
		// Add the last name explicitly since it doesn't end in a comma. 
		// Could add a safety check in here in case you want to work with files that may or may not end in comma, but this is fine for this solution.
		namestorage.push_back(name);
	}
	else {
		cout << "File did not open!" << endl;
	}
	names.close();
	// Create a vector of integer values to represent the characters.
	vector<vector<int>> valuestorage;
	for (int i = 0; i < namestorage.size(); i++) {
		vector<int> values;
		for (int j = 0; j < namestorage[i].size(); j++) {
			// Get the letter value of the letter. Since we are using ASCII and the file is all capitalized, the letters start at 65 (A). 
			// Subtracting 64 from the character values as integers will get us the desired values. We then store that value in our new integer vector.
			values.push_back(namestorage[i][j] - 64);
		}
		valuestorage.push_back(values);
	}
	vector<vector<int>> sortedstorage;
	Bucket b(valuestorage);
	bucketSort(b, 0, sortedstorage);
	int total = 0;
	for (int i = 0; i < sortedstorage.size(); i++) {
		int temp = 0;
		for (int j = 0; j < sortedstorage[i].size(); j++){
			temp += sortedstorage[i][j];
		}
		temp *= (i + 1);
		total += temp;
	}
	cout << "The total namescore of all the names in names.txt is: " << total << endl; 
	return 0;
}
