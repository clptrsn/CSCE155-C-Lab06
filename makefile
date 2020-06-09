#
# makefile for image and color utilities C library
#
#

CC = gcc -std=gnu99
FLAGS = -Wall
INCLUDES = -lm

imageDriver: imageUtils.o colorUtils.o imageDriver.c
	$(CC) $(FLAGS) imageUtils.o colorUtils.o imageDriver.c -o imageDriver $(INCLUDES) 

imageUtils.o: imageUtils.c imageUtils.h
	$(CC) $(FLAGS) -c imageUtils.c -o imageUtils.o $(INCLUDES) 

colorUtilsTesterCmocka: colorUtils.o colorUtilsTesterCmocka.c
	$(CC) $(FLAGS) colorUtils.o colorUtilsTesterCmocka.c -o colorUtilsTesterCmocka $(INCLUDES) -l cmocka

colorUtils.o: colorUtils.c colorUtils.h
	$(CC) $(FLAGS) -c colorUtils.c -o colorUtils.o $(INCLUDES) 

clean:
	rm -f *~ *.o
