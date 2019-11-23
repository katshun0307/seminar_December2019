
TEX = lualatex
target = slide.pdf

.PHONY: all clean

all: 
	make $(target)

clean:
	$(RM) *.aux *.log *.dvi *.bcf *.fls *.snm *.bbl *.blg *.out *.nav *.xml *.vrb *.toc

outclean: 
	make clean
	rm *.pdf

%.pdf: %.dvi
	dvipdfmx $<

%.pdf: %.tex
	$(TEX) --shell-escape -interaction=batchmode $<
	# biber --onlylog $*
	# $(TEX) --shell-escape -interaction=batchmode $<
