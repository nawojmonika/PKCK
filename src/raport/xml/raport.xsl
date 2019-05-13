<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html " encoding="utf-8" />

    <xsl:template match="/lista_studentow">
        <html>
            <head>
                <title>Lista studentów</title>
            </head>
            <body>
                <h1>Lista studentów</h1>
                <table>
                    <xsl:for-each select="student">
                        <xsl:sort select="nazwisko" data-type="text" lang="pl"/>
                        <tr>
                            <td><xsl:value-of select="nazwisko"/></td>
                            <td><xsl:value-of select="imię"/></td>
                            <td><xsl:value-of select="grupa"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
