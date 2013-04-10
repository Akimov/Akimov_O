#include <stdio.h>

#include <stdlib.h>

#include <dirent.h>

#include <string.h>


int main (int argc, char** argv) 
{
  
	FILE* f = fopen ( "output.txt", "w" );
	
	if ( !strcmp ( argv[1],"-ls" ) )
	{
			
		if (argc == 2)
		{
		
			DIR *_dir = opendir("/");

			if(_dir == NULL) 
			{

			        perror("opendir");

			        fprintf(f,"ERROR\n");

			        return -1;

			}

			struct dirent *_st;

			while ( _st = readdir(_dir) ) 
				fprintf( f,"%s\n", _st->d_name );

			closedir(_dir);

		}

		if (argc == 3)
		{

			DIR *_dir = opendir(argv[2]);

			if(_dir == NULL) 
			{
		
			       perror("opendir");
	
			       return -1;

			}

			struct direct_st *_st;

			while (_st = readdir(_dir)) 
				fprintf(f,"%s\n", _st->d_name);

			closedir(_dir);

		}


	}

	return 0;

}
