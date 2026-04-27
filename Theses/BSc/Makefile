LATEXMK = latexmk -xelatex

all: BSc

BSc:
	$(LATEXMK) BScThesis

gogo:
	$(LATEXMK) -gg BScThesis

clean:
	latexmk -c

distclean:
	latexmk -C
	rm -fr auto/
