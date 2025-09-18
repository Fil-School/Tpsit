<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h1>Libri</h1>
                <xsl:for-each select="bib/book">
                    <div style="margin-bottom: 1em;">
                        <h2><xsl:value-of select="title"/></h2>
                        <p>Prezzo: <xsl:value-of select="prezzo"/></p>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>