
cat rendition.mdml rendition-hg.mdml | \
pandoc -s - | xsltproc --novalid -o index.html xhtml2s6.xsl -



