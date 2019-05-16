<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ga="gatunek">
    <xsl:output method="text" encoding="utf-8" indent="yes"/>
    <xsl:template match="/raport">
        <xsl:variable name="enter" select="'&#13;'"/>
        <xsl:text>Raport sprzedaży</xsl:text>
        <xsl:value-of select="$enter" />
        <xsl:text>Gatunek   Wykonawca   Nazwa   Cena   Waluta</xsl:text>
        <xsl:value-of select="$enter" />
        <xsl:for-each select="sprzedaż/płyta">
            <xsl:variable name="gatunek" select="concat(@gatunek, ' ')"/>
            <xsl:variable name="wykonawca" select="concat(wykonawca, ' ')"/>
            <xsl:variable name="nazwa" select="concat(nazwa, ' ')"/>
            <xsl:variable name="cena" select="concat(cena, ' ')"/>
            <xsl:variable name="waluta" select="concat(cena/@waluta, ' ')"/>

            <xsl:value-of select="concat($gatunek, $wykonawca, $nazwa, $cena, $waluta)"/>
            <xsl:value-of select="$enter" />
        </xsl:for-each>
        <xsl:value-of select="$enter" />
        <xsl:text>Podsumowanie</xsl:text>
        <xsl:value-of select="$enter" />
        <xsl:text>Data wygenerowania raportu   Liczba płyt   Liczba gatunków muzyki   Wartość netto   Wartość brutto  Liczba betsellerów</xsl:text>
        <xsl:value-of select="$enter" />
        <xsl:variable name="data-wygenerowania" select="concat(podsumowanie/element/data-wygenerowania, ' ')"/>
        <xsl:variable name="liczba-płyt" select="concat(podsumowanie/element/liczba-płyt, ' ')"/>
        <xsl:variable name="liczba-gatunków" select="concat(podsumowanie/element/liczba-gatunków, ' ')"/>
        <xsl:variable name="wartość-netto" select="concat(podsumowanie/element/wartość-netto, ' ')"/>
        <xsl:variable name="wartość-brutto" select="concat(podsumowanie/element/wartość-brutto, ' ')"/>
        <xsl:variable name="liczba-bestsellerów" select="concat(podsumowanie/element/liczba-bestsellerów, ' ')"/>
        <xsl:value-of select="concat($data-wygenerowania, $liczba-płyt, $liczba-gatunków, $wartość-netto, $wartość-brutto, $liczba-bestsellerów)"/>
    </xsl:template>
</xsl:stylesheet>