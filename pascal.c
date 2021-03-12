#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void CalculatePascal(int ** pnumbers, int table);

int main(int argc, const char *argv[]) 
{
	const int linecount = atoi(argv[1]); //take arguments
	int** pnumbers;

	pnumbers = (int **) malloc( linecount * sizeof(int *)); //make enough space for pointer to integer pointer!
	for(int i=0; i<=linecount; i++)
	{
		pnumbers[i] = (int *) malloc((i+1) * sizeof(int)); //declare 2D array and allocate mem.		
	}
  	CalculatePascal(pnumbers, linecount);// calculate the pascal see funct.
  	for(int w=0; w<=linecount; w++)
  	{
  		for(int k=0; k<=w; k++)
  		{
  			printf("%i ",pnumbers[w][k]);
  		}
  		printf("\n");
  	}#
  	// I should actually free the memory but it ends here so no lole


}

void CalculatePascal(int ** pnumbers, int table)
{
	pnumbers[0][0] = 1; //easy to declare these like this
	pnumbers[1][0] = 1;
	pnumbers[1][1] = 1;
	if(table < 2) return;
    for(int i=2; i<=table; i++)
    {
    	pnumbers[i][0]=1;
    	for(int q=1; q<i; q++)
    	{
    		pnumbers[i][q]= pnumbers[i-1][q-1]+pnumbers[i-1][q]; //euation for pascal's next
    	}
    	pnumbers[i][i]=1; //will write on the pointer(s) so no return

    }

}
