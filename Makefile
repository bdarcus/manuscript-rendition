FILES = *.mdml
PANDOC = pandoc -s 
CSS =screen.css
OUTFN = rendition

html: ${FILES} Makefile 
	${PANDOC} -5 --section-divs -c ${CSS} -o out/${OUTFN}.html ${FILES}

odt: ${FILES} Makefile
	${PANDOC} -s -t odt -o out/${OUTFN}.odt ${FILES}

all: html odt 
