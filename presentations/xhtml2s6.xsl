<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="xhtml" version="1.0">

  <xsl:output method="xml" indent="yes"/>

  <xsl:param name="uri-base">http://www.users.muohio.edu/darcusb</xsl:param>

  <xsl:template match="/">
    <xsl:param name="title">
      <xsl:value-of select="/xhtml:html/xhtml:head/xhtml:title"/>
    </xsl:param>
    <xsl:param name="author">
      <xsl:value-of select="/xhtml:html/xhtml:head/xhtml:meta[@name='author']/@content"/>
    </xsl:param>
    <html>
      <head>
        <title>
          <xsl:value-of select="$title"/>
        </title>
        <meta name="author" content="{$author}"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

        <!-- configuration parameters -->
        <meta name="defaultView" content="slideshow"/>

        <!-- style sheet links -->
        <!-- theme stylesheet -->
        <link rel="stylesheet" href="{$uri-base}/ui/slate/slides.css" type="text/css"
          media="projection" id="slideProj"/>

        <!-- default stylesheets for outline and printing -->
        <link rel="stylesheet" href="{$uri-base}/ui/default/outline.css" type="text/css"
          media="screen" id="outlineStyle"/>
        <link rel="stylesheet" href="{$uri-base}/ui/default/print.css" type="text/css"
          media="print" id="slidePrint"/>

        <!-- S6 JS -->
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js">&#160;</script>

        <script src="{$uri-base}/js/slides.js" type="text/javascript">&#160;</script>

      </head>
      <body>
        <div class="layout">
          <div class="background">
            <object data="{$uri-base}/ui/slate/background.svg" width="100%" height="100%"/>
          </div>
          <div id="controls">&#160;</div>

          <div id="currentSlide">&#160;</div>
          <div id="header">&#160;</div>
          <div id="footer">
            <h1>
              <xsl:value-of select="$title"/>
            </h1>
          </div>
        </div>

        <ol class="xoxo presentation">
          <li class="slide title">
            <h1 class="title">
              <xsl:value-of select="$title"/>
            </h1>
            <h2 class="author">
              <xsl:value-of select="$author"/>
            </h2>
          </li>
          <xsl:apply-templates select="//xhtml:div[xhtml:h1]"/>
        </ol>

      </body>
    </html>
  </xsl:template>

  <xsl:template match="xhtml:div[xhtml:h1]">
    <xsl:param name="title">
      <xsl:if test="not(xhtml:ol|xhtml:ul|xhtml:blockquote|xhtml:dl)"> title</xsl:if>
    </xsl:param>
    <xsl:param name="imgbig">
      <xsl:if test="count(.//xhtml:img) = 1"> imgbig</xsl:if>
    </xsl:param>
    <xsl:param name="hide">
      <xsl:if test="starts-with(xhtml:h1, 'img:')"> hide-header</xsl:if>
    </xsl:param>
    <li class="slide{$title}{$imgbig}{$hide}">
      <xsl:copy-of select="*"/>
    </li>
  </xsl:template>

</xsl:stylesheet>
