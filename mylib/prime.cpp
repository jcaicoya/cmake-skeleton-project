#include "prime.h"

bool isPrime(int value)
{
	bool isFoundDivisor = false;
	if (value < 4)
	{
		return true;
	}

	if (value%2 == 0)
	{	
		return false;
	}

	int ii = 3;
	while (!isFoundDivisor && ii*ii <= value)
	{

		if (value % ii == 0)
		{
			isFoundDivisor = true;
		}
		else
		{
			ii += 2;
		}

	}

	return !isFoundDivisor;
}
