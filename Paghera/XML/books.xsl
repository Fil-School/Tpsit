<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version = "1.0" xmlns:xsl="https://www.w3.org/1999/XSL/Transform">
<xsl:template match = "/">

<html>
    <xsl:for-each select = "bib/book">
    <h2><xsl:value-of select="title"/></h2>
    </xsl:for-each>
</html>
</xsl:template>
</xsl:stylesheet>