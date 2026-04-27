all: BSc Master

BSc:
	$(MAKE) -C BSc

Master:
	$(MAKE) -C Master

clean:
	$(MAKE) -C BSc clean
	$(MAKE) -C Master clean

distclean:
	$(MAKE) -C BSc distclean
	$(MAKE) -C Master distclean

.PHONY: all BSc Master clean distclean
