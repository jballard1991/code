#include <stdlib.h> //include needed for rand
#include <stdio.h> //	      needed for printf
#include <time.h> //	      needed for srand time call
/*
* A program to print strings and numbers to the screen, with unique output every time
*/

int main () 
{
	srand(time(NULL));  // this initializes the PRNG against the current unix time, i think
	while (1) {
		int b = rand() % 2;  // create ints b and c, should probably be fucking bools, used as logical controls
		int c = rand() % 2;
		if (b) 
			{
				int r = rand() %9; // print a random number if we have a success on this loop iteration
				printf("%d",r);
			}
		if (c)
			{
				char rl = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&*()_+-=`~;:[]{}<> "[random () % 77];  // there is probably a better way do do this besides mapping...
				printf("%c",rl);
			}
	}

}
