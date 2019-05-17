<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ga="gatunek">
    <xsl:output method="text" encoding="utf-8" indent="yes"/>
    <xsl:template match="/raport">
        <xsl:variable name="enter" select="'&#13;'"/>
        <xsl:value-of select="sprzedaż/tytuł"/>
        <xsl:value-of select="$enter" />
        <xsl:text>Waluta: </xsl:text>
        <xsl:value-of select="sprzedaż/@waluta"/>
        <xsl:value-of select="$enter" />
        <xsl:text>Ilość Wykonawca Nazwa Cena Gatunek</xsl:text>
        <xsl:value-of select="$enter" />
        <xsl:for-each select="sprzedaż/płyta">
            <xsl:value-of select="*"/>
            <xsl:value-of select="concat(' ', @gatunek )"/>
            <xsl:value-of select="$enter" />
        </xsl:for-each>
        <xsl:value-of select="$enter" />
        <xsl:value-of select="podsumowanie/tytuł"/>
        <xsl:value-of select="$enter" />
        <xsl:for-each select="podsumowanie/element">
            <xsl:value-of select="concat(nazwa, ' ')"/>
        </xsl:for-each>
        <xsl:value-of select="$enter" />
        <xsl:value-of select="podsumowanie/element/*[not(self::nazwa)]"/>
    </xsl:template>
</xsl:stylesheet>