<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Libri</title>
            </head>
            <body>
                <h1>Tutti Libri</h1>
                <xsl:for-each select="bib/book">
                    <xsl:sort select="prezzo" order="ascending"/>
                    <div style="margin-bottom: 1em;">
                        <h2><xsl:value-of select="title"/></h2>
                        <xsl:if test="prezzo &gt;= 15">
                            <p>Prezzo: <xsl:value-of select="prezzo"/></p>
                        </xsl:if>    
                    </div>
                </xsl:for-each>

                <h1>Inglese</h1>
                <xsl:for-each select="bib/book[title[@lang='eng']]">
                    <xsl:sort select="prezzo" order="ascending"/>
                    <div style="margin-bottom: 1em;">
                        <h2><xsl:value-of select="title"/></h2>
                        <xsl:if test="prezzo &gt;= 0">
                            <p>Prezzo: <xsl:value-of select="prezzo"/></p>
                        </xsl:if>    
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>