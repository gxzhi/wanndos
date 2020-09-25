include ../make.sys

objects = flib.o interpolate_bands.o

LIBS = ../modules/mod.a

wanndos: $(LIBS) $(objects) wanndos.f90
	$(F90) $(F90FLAGS) -fpp -o wanndos.x wanndos.f90 $(objects) $(LIBS) $(INCLUDES) $(LAPACK95LIBS) $(MKLLIBS)
	
$(LIBS):
	cd ../modules && make mod.a

clean:
	rm -rf *.o *.mod *.x
	cd ../modules && make clean
