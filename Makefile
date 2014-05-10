# makefile pro preklad LaTeX verze Bc. prace
# (c) 2008 Michal Bidlo
# E-mail: bidlom AT fit vutbr cz
#===========================================
# asi budete chtit prejmenovat:
CO=xmesza04_BP

all: $(CO).pdf

pdf: $(CO).pdf

$(CO).ps: $(CO).dvi
	dvips $(CO)

$(CO).pdf: clean
	pdflatex $(CO)
	bibtex $(CO)
	pdflatex $(CO)
	pdflatex $(CO)
	cp xmesza04_BP.pdf ~/WWW/IBP/xmesza04_BP.pdf
	
$(CO).dvi: $(CO).tex $(CO).bib
	latex $(CO)
	bibtex $(CO)
	latex $(CO)
	latex $(CO)

desky:
#	latex desky
#	dvips desky
#	dvipdf desky
	pdflatex desky

vlna:
	vlna -m -v KkSsVvZzOoUuAaIi *.tex
	

clean:
	rm -f *.dvi *.log $(CO).blg $(CO).bbl $(CO).toc *.aux $(CO).out $(CO).lof $(CO).lot
	rm -f $(CO).pdf
	rm -f *~

pack:
	tar czvf bp-xmesza04.tar.gz *.tex *.bib *.bst ./fig/* ./cls/* Makefile Changelog


