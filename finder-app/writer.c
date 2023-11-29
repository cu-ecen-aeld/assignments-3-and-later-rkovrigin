#include <stdlib.h>
#include <stdio.h>
#include <syslog.h>


int main(int argc, char *argv[])
{
	openlog("rkovrigin-writer", LOG_PID, LOG_USER);

	if (argc < 3)
	{
		syslog(LOG_ERR, "Not enough arguments!\n");
		return 1;
	}
	char *path = argv[1];
	char *str = argv[2];
	FILE *f;

	if ((f = fopen(path, "w")) == NULL)
	{
		syslog(LOG_ERR, "Can't open file path %s!\n", path);
		return 1;
	}

	if (fprintf(f, "%s", str) < 0)
	{
		syslog(LOG_ERR, "Can't write %s to %s!\n", str, path);
		return 1;
	}

	syslog(LOG_DEBUG, "Writing %s to %s", str, path);

	fclose(f);

    return 0;
}
