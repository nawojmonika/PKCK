<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ga="gatunek">
    <xsl:output method="xml" encoding="utf-8" indent="yes"/>
    <xsl:template match="/">
        <raport>
            <sprzedaż>
                <tytuł>Raport sprzedaży</tytuł>
                <xsl:for-each select="__ROOT__ /tabela-płyt/płyty/płyta">
                    <płyta>
                        <xsl:attribute name="gatunek">
                            <xsl:value-of select="//ga:gatunek"/>
                        </xsl:attribute>
                        <wykonawca>
                            <xsl:value-of select="nazwa-wykonawcy"/>
                        </wykonawca>
                        <nazwa>
                            <xsl:value-of select="tytuł"/>
                        </nazwa>
                        <cena>
                            <xsl:attribute name="waluta">
                                <xsl:value-of select="cena/@waluta"/>
                            </xsl:attribute>
                            <xsl:value-of select="cena"/>
                        </cena>
                    </płyta>
                </xsl:for-each>
            </sprzedaż>
            <podsumowanie>
                <tytuł>Podsumowanie</tytuł>
                <element>
                    <element>
                        <nazwa>Data wygenerowania raportu:</nazwa>
                        <wartość>
                        </wartość>
                    </element>
                    <nazwa>Liczba płyt:</nazwa>
                    <wartość>
                        <xsl:value-of select="count(__ROOT__ /tabela-płyt/płyty/płyta)"/>
                    </wartość>
                </element>
                <element>
                    <nazwa>Liczba gatunków muzyki:</nazwa>
                    <wartość>
                        <xsl:value-of select="count(__ROOT__ /gatunki//ga:gatunek)"/>
                    </wartość>
                </element>
                <element>
                    <nazwa>Wartość netto:</nazwa>
                    <wartość>
                        <xsl:variable name="cenaNetto" select="sum(__ROOT__ /tabela-płyt/płyty/płyta/cena)"></xsl:variable>
                        <xsl:value-of select='format-number($cenaNetto, "#.00")'/>
                    </wartość>
                </element>
                <element>
                    <nazwa>Wartość brutto:</nazwa>
                    <wartość>
                        <xsl:variable name="cenaNetto" select="sum(__ROOT__ /tabela-płyt/płyty/płyta/cena)"></xsl:variable>
                        <xsl:variable name="cenaBrutto" select="$cenaNetto + ($cenaNetto * 0.23)"></xsl:variable>
                        <xsl:value-of select='format-number($cenaBrutto, "#.00")'/>
                    </wartość>
                </element>
                <element>
                    <nazwa>Liczba bestselletów:</nazwa>
                    <wartość>
                        <xsl:value-of select="count(__ROOT__ /tabela-płyt/płyty/płyta[@bestseller='true'])"/>
                    </wartość>
                </element>
            </podsumowanie>
        </raport>
    </xsl:template>
</xsl:stylesheet>