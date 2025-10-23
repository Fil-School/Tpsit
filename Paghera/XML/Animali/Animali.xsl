<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">

    <html>
        <style>
            tr {
                text-align: center;
                font-family: Arial, Helvetica, sans-serif;
            }

        </style>
        <body>
            <h2 style="color: white; background-color: blue; text-shadow: 1px 1px 1px; text-align: center;">Animali con ID=P03</h2>

            <table border="1" cellpadding="10" cellspacing="0" style="margin: 0 auto; align: center; min-width: 100%;">
                <tr bgcolor="blue" style="color: white;">
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Specie</th>
                    <th>Età</th>
                </tr>
                <xsl:for-each select="animali/pet">
                <xsl:sort select="nome" order="descending"/>
                <xsl:if test="@id='p01'">
                    <tr>
                        <td><xsl:value-of select="@id"/></td>
                        <td><xsl:value-of select="nome"/></td>
                        <td><xsl:value-of select="razza"/></td>
                        <td><xsl:value-of select="anni"/></td>
                    </tr>
                </xsl:if>
                </xsl:for-each>
            </table>

            <h2 style="color: white; background-color: blue; text-shadow: 1px 1px 1px; text-align: center;">Minore 5 anni</h2>

            <table border="1" cellpadding="10" cellspacing="0" style="margin: 0 auto; align: center; min-width: 100%;">
                <tr bgcolor="blue" style="color: white;">
                    <th>Nome</th>
                    <th>Specie</th>
                    <th>Età</th>
                </tr>
                <xsl:for-each select="animali/pet">
                <xsl:sort select="nome" order="ascending"/>
                <xsl:if test="anni &lt; 5">
                    <tr>
                        <td><xsl:value-of select="nome"/></td>
                        <td><xsl:value-of select="razza"/></td>
                        <td><xsl:value-of select="anni"/></td>
                    </tr>
                </xsl:if>
                </xsl:for-each>
            </table>

            <h2 style="color: white; background-color: blue; text-shadow: 1px 1px 1px; text-align: center;">r02</h2>

            <table border="1" cellpadding="10" cellspacing="0" style="margin: 0 auto; align: center; min-width: 100%;">
                <tr bgcolor="blue" style="color: white;">
                    <th>Nome</th>
                    <th>Pelo</th>
                </tr>
                <xsl:for-each select="animali/pet">
                <xsl:sort select="nome" order="ascending"/>
                <xsl:if test="razza/@id_razza='r02'">
                    <tr>
                        <td><xsl:value-of select="nome"/></td>
                        <td><xsl:value-of select="pelo"/></td>
                    </tr>
                </xsl:if>
                </xsl:for-each>
            </table>

            <h2 style="color: white; background-color: blue; text-shadow: 1px 1px 1px; text-align: center;">Ordine Alfabetico</h2>

            <table border="1" cellpadding="10" cellspacing="0" style="margin: 0 auto; align: center; min-width: 80%; max-width: 100px;">
                <tr bgcolor="blue" style="color: white;">
                    <th>Nome</th>
                    <th>Specie</th>
                    <th>Età</th>
                </tr>
                <xsl:for-each select="animali/pet">
                <xsl:sort select="nome" order="ascending"/>
                    <tr>
                        <td><xsl:value-of select="nome"/></td>
                        <td><xsl:value-of select="razza"/></td>
                        <td><xsl:value-of select="anni"/></td>
                    </tr>
                </xsl:for-each>
            </table>
        </body>
    </html>
    </xsl:template>
</xsl:stylesheet>