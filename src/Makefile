.PHONY: all

all: vcimgnetsrv vcmipidemo

clean:
	-rm -f vcimgnetsrv vcmipidemo

vcimgnetsrv:  vcimgnetsrv.c vclib-excerpt.c
	$(CC) -ggdb -Wall -O3  -o vcimgnetsrv vcimgnetsrv.c vclib-excerpt.c -lrt
	
vcmipidemo:  vcmipidemo.c vcimgnet.c vclib-excerpt.c
	$(CC) -ggdb -Wall -O3 -fopenmp -o vcmipidemo vcmipidemo.c vcimgnet.c vclib-excerpt.c -lrt