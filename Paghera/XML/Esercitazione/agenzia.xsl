<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Risultati Agenzia Viaggi</title>
            </head>
            <body>
                <h1>Viaggi con prezzo &lt; 1000</h1>
                <xsl:for-each select="agenzia/viaggio">
                    <xsl:if test="prezzo &lt; 1000">
                        <div>
                            <p>IDViaggio: <xsl:value-of select="@IDViaggio"/></p>
                            <p>Destinazione: <xsl:value-of select="destinazione"/></p>
                            <p>Prezzo: <xsl:value-of select="prezzo"/></p>
                        </div>
                    </xsl:if>
                </xsl:for-each>

                <h1>Viaggi di tipo Mare</h1>
                <xsl:for-each select="agenzia/viaggio">
                    <xsl:if test="tipo = 'Mare'">
                        <div>
                            <p>IDViaggio: <xsl:value-of select="@IDViaggio"/></p>
                            <p>Destinazione: <xsl:value-of select="destinazione"/></p>
                            <p>Tipo: <xsl:value-of select="tipo"/></p>
                        </div>
                    </xsl:if>
                </xsl:for-each>

                <h1>Viaggi con prezzo &gt; 1200 di tipo Montagna</h1>
                <xsl:for-each select="agenzia/viaggio">
                    <xsl:if test="prezzo &gt; 1200 and tipo = 'Montagna'">
                        <div>
                            <p>IDViaggio: <xsl:value-of select="@IDViaggio"/></p>
                            <p>Destinazione: <xsl:value-of select="destinazione"/></p>
                            <p>Prezzo: <xsl:value-of select="prezzo"/></p>
                            <p>Tipo: <xsl:value-of select="tipo"/></p>
                        </div>
                    </xsl:if>
                </xsl:for-each>

                <h1>Viaggi con durata &lt; 15 giorni e tipo Città</h1>
                <xsl:for-each select="agenzia/viaggio">
                    <xsl:if test="durata &lt; 15 and tipo = 'Città'">
                        <div>
                            <p>IDViaggio: <xsl:value-of select="@IDViaggio"/></p>
                            <p>Destinazione: <xsl:value-of select="destinazione"/></p>
                            <p>Durata: <xsl:value-of select="durata"/></p>
                            <p>Tipo: <xsl:value-of select="tipo"/></p>
                        </div>
                    </xsl:if>
                </xsl:for-each>

                <h1>Prezzo dei viaggi con IDCompagnia = C2</h1>
                <xsl:for-each select="agenzia/viaggio">
                    <xsl:if test="destinazione/@IDCompagnia = 'C2'">
                        <div>
                            <p>IDViaggio: <xsl:value-of select="@IDViaggio"/></p>
                            <p>Destinazione: <xsl:value-of select="destinazione"/></p>
                            <p>Prezzo: <xsl:value-of select="prezzo"/></p>
                        </div>
                    </xsl:if>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>