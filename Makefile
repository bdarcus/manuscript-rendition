FILES = 0*.mdml
PANDOC = pandoc -s 
CSS =-c screen.css
OUTFN = rendition

html: ${FILES} 
	${PANDOC} ${CSS} -o html/${OUTFN}.html ${FILES}

pdf: ${FILES}
	${PANDOC} -t latex -o html/${OUTFN}.tex ${FILES}
