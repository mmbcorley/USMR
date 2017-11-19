objects = l1-16.pdf l6-16.pdf l7-16.pdf l8-16.pdf l9-16.pdf

# shouldn't need any changes below here

LATEXMK= latexmk --pdf
RSCRIPT = Rscript
SED = sed

.PHONY:	all clean tidy

all:	$(objects)

$(objects): %.pdf: %.tex	
	$(LATEXMK) $<
	rm -f Rplots.pdf

%.tex: %.Rnw
	[[ -d img ]] || mkdir img
	$(RSCRIPT) -e "library(knitr); knit(\"$*.Rnw\")"

tidy:
	latexmk -c

clean:	
	latexmk -C
	rm -f img/auto-*
	rm -f cache/*
	rm -f *.tex *.vrb

forget:
	$(SED) -e 's/\newenvironment{knitrout}{}{}/\newenvironment{knitrout}{\setlength{\topsep}{0mm}}{}/' "$*.tex"
