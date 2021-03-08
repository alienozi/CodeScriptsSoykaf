#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void CalculatePascal(int ** pnumbers, int table);

int main(int argc, const char *argv[]) 
{
	const int linecount = atoi(argv[1]);
	int** pnumbers;

	pnumbers = (int **) malloc( linecount * sizeof(int *));
	for(int i=0; i<=linecount; i++)
	{
		pnumbers[i] = (int *) malloc((i+1) * sizeof(int));		
	}
  	CalculatePascal(pnumbers, linecount);
  	for(int w=0; w<=linecount; w++)
  	{
  		for(int k=0; k<=w; k++)
  		{
  			printf("%i ",pnumbers[w][k]);
  		}
  		printf("\n");
  	}


}

void CalculatePascal(int ** pnumbers, int table)
{
	pnumbers[0][0] = 1;
	pnumbers[1][0] = 1;
	pnumbers[1][1] = 1;
	if(table < 2) return;
    for(int i=2; i<=table; i++)
    {
    	pnumbers[i][0]=1;
    	for(int q=1; q<i; q++)
    	{
    		pnumbers[i][q]= pnumbers[i-1][q-1]+pnumbers[i-1][q];
    	}
    	pnumbers[i][i]=1;

    }

}
