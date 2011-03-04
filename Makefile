FILES = *.mdml
PANDOC = pandoc -s 
CSS =screen.css
OUTFN = rendition

html: ${FILES} ${CSS} Makefile 
	${PANDOC} -5 --section-divs -c ${CSS} -o html/${OUTFN}.html ${FILES}

pdf: ${FILES}
	${PANDOC} -t latex -o html/${OUTFN}.tex ${FILES}
	cd html
	pdfltex rendition.tex
	cd ..

