######################################################################
# LatexTemplate Makefile
# By Simon Pratt
# November 10, 2010
######################################################################

MAIN_FILE   = assignment

REFERENCES  = references

FIGURES     =

STYLES_DIR  = styles

STYLES      = Assignment \
              CGAlgorithms \
              HeaderStuff \
              QuestionAnswer \
              TheoremStuff

######################################################################
# Modify the following at your own risk
######################################################################

.PHONY: open clean

MAIN_TEX    = ${MAIN_FILE}.tex

PARTS_TEX    = ${addsuffix .tex,${PARTS}}

BIBFILES    = ${addsuffix .bib,${REFERENCES}}

STYLES_STY  = ${addprefix ${STYLES_DIR}/,${addsuffix .sty,${STYLES}}}

PDF         = ${MAIN_FILE}.pdf

${PDF}: ${MAIN_TEX} ${PARTS_TEX} ${FIGURES} ${BIBFILES} ${STYLES_STY}

# if your open program isn't listed, OR (||) it to the end
open: ${PDF}
	open $< || gnome-open $<

%.pdf: %.tex
	rubber -d $<

# add stuff to delete here
clean:
	rm -f *.log *.aux *.dvi *.blg *.bbl ${PDF}
