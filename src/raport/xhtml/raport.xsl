<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xhtml" encoding="utf-8" indent="yes"/>
    <xsl:template match="/raport">
        <html>
            <head></head>
            <body>
                <h2>
                    <xsl:value-of select="sprzedaż/tytuł"/>
                </h2>
                <table border="1">
                    <tr>
                        <xsl:for-each select="distinct-values(sprzedaż/płyta/*/name())">
                            <th>
                                <xsl:value-of select="."/>
                            </th>
                        </xsl:for-each>
                        <xsl:for-each select="distinct-values(sprzedaż/płyta/@*/name())">
                            <th>
                                <xsl:value-of select="."/>
                            </th>
                        </xsl:for-each>
                    </tr>
                    <xsl:for-each select="sprzedaż/płyta">
                        <tr>
                            <xsl:for-each select="*">
                                <td>
                                    <xsl:value-of select="."/>
                                </td>
                            </xsl:for-each>
                            <xsl:for-each select="@*">
                                <td>
                                    <xsl:value-of select="."/>
                                </td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </table>
                <h2>
                    <xsl:value-of select="podsumowanie/tytuł"/>
                </h2>
                <table border="1">
                    <tr>
                        <xsl:for-each select="podsumowanie/element/nazwa">
                            <th>
                                <xsl:value-of select="."/>
                            </th>
                        </xsl:for-each>
                    </tr>
                        <tr>
                            <xsl:for-each select="podsumowanie/element/*[not(self::nazwa)]">
                                <td>
                                    <xsl:value-of select="."/>
                                </td>
                            </xsl:for-each>
                        </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

