#include <prime.h>

#include <iostream>
using namespace std;

int main()
{
	cout << "Please, introduce integer: ";
	cout.flush();
	int value;
	cin >> value;
	cin.clear();
	
	if (isPrime(value))
	{
		cout << value << " is prime\n";
	}
	else
	{
		cout << value << " is not prime\n";
	}

	return 0;
}
