TEXINPUTS:=.

LEC= \
	pdf/background.pdf \
	pdf/2020-01-22.pdf \
	pdf/2020-01-24.pdf \
	pdf/2020-01-27.pdf \
	pdf/2020-01-29.pdf \
	pdf/2020-01-31.pdf \
	pdf/2020-02-05.pdf \
	pdf/2020-02-10.pdf 

.PHONY: all copy
all: $(LEC)

pdf/%.pdf: notes/%.tex
	xelatex -output-dir pdf $<
	xelatex -output-dir pdf $<

pdf/2020-01-22.pdf: notes/2020-01-22.tex
	xelatex -output-dir pdf $<
	bibtex pdf/2020-01-22
	xelatex -output-dir pdf $<
	xelatex -output-dir pdf $<

clean:
	rm -f pdf/*.aux pdf/*.log pdf/*.out
	rm -f pdf/*.nav pdf/*.snm pdf/*.toc 
	rm -f pdf/*.vrb

distclean: clean
	rm -f pdf/*.pdf

copy:
	mkdir -p ../web/lec
	cp $(LEC) ../web/lec
