LATEXMK = latexmk -xelatex

all: Master

Master:
	$(LATEXMK) MasterThesis

gogo:
	$(LATEXMK) -gg MasterThesis

clean:
	latexmk -c

distclean:
	latexmk -C
	rm -fr auto/
