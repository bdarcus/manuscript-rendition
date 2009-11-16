
cat rendition.mdml rendition-hg.mdml | \
pandoc -s - | xsltproc --stringparam uri-base "http://bruce.darcus.name/media/s6/" --novalid -o index.html xhtml2s6.xsl -



