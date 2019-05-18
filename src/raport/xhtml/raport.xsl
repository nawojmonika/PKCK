<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xhtml" encoding="utf-8" indent="yes" omit-xml-declaration="yes"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
    <xsl:template match="/raport">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl">
            <head>
                <title>
                    <xsl:value-of select="sprzedaż/tytuł"/>
                </title>
            </head>
            <body>
                <div id="menu">
                    <!--<xsl:attribute name="aria-role" select="'navigation'"/>-->
                    <a href="#podsumowanie-sprzedaży">Raport sprzedaży </a>
                    <a href="#podsumowanie">Podsumowanie </a>
                </div>
                <h2>
                    <xsl:value-of select="sprzedaż/tytuł"/>
                </h2>
                <table id="podsumowanie-sprzedaży" border="1">
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
                <div>
                    <a href="#menu">Przejdź do menu</a>
                </div>
                <h2>
                    <xsl:value-of select="podsumowanie/tytuł"/>
                </h2>
                <table id="podsumowanie" border="1">
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
                <div>
                    <a href="#menu">Przejdź do menu</a>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

