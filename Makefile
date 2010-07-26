html:
	pandoc -s -c screen.css -o html/rendition.html 0*.mdml

odf:
	pandoc -s -t odt -o html/rendition.odt 0*.mdml

all: odf html 
