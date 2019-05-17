<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ga="gatunek">
    <xsl:output method="xml" encoding="utf-8" indent="yes"/>
    <xsl:template match="/__ROOT__">
        <raport>
            <sprzedaż>
                <xsl:attribute name="waluta">
                    <xsl:value-of select="tabela-płyt/płyty/@waluta"/>
                </xsl:attribute>
                <tytuł>Raport sprzedaży</tytuł>
                <xsl:for-each select="tabela-płyt/płyty/płyta">
                    <płyta>
                        <xsl:attribute name="gatunek">
                            <xsl:value-of select="ga:gatunek"/>
                        </xsl:attribute>
                        <ilość>
                            <xsl:value-of select="zakup"/>
                        </ilość>
                        <wykonawca>
                            <xsl:value-of select="nazwa-wykonawcy"/>
                        </wykonawca>
                        <nazwa>
                            <xsl:value-of select="tytuł"/>
                        </nazwa>
                        <cena>
                            <xsl:value-of select="cena"/>
                        </cena>
                    </płyta>
                </xsl:for-each>
            </sprzedaż>
            <podsumowanie>
                <tytuł>Podsumowanie</tytuł>
                <element>
                    <nazwa>Data wygenerowania raportu:</nazwa>
                    <data-wygenerowania>
                        <xsl:value-of select="format-date(current-date(),  '[D01].[M01].[Y0001]')" />
                    </data-wygenerowania>
                </element>
                <element>
                    <nazwa>Liczba płyt:</nazwa>
                    <liczba-płyt>
                        <xsl:value-of select="count(tabela-płyt/płyty/płyta)"/>
                    </liczba-płyt>
                </element>
                <element>
                    <nazwa>Liczba gatunków muzyki:</nazwa>
                    <liczba-gatunków>
                        <xsl:value-of select="count(gatunki/ga:gatunek)"/>
                    </liczba-gatunków>
                </element>
                <xsl:variable name="cenaNetto"
                              select="sum( for $i in tabela-płyt/płyty/płyta return $i/zakup * $i/cena)"/>
                <xsl:variable name="waluta" select="tabela-płyt/płyty/@waluta"/>
                <element>
                    <nazwa>Wartość netto:</nazwa>
                    <wartość-netto>
                        <xsl:value-of select='concat(format-number($cenaNetto, "#.00"), " ", $waluta)'/>
                    </wartość-netto>
                </element>
                <element>
                    <nazwa>Wartość brutto:</nazwa>
                    <wartość-brutto>

                        <xsl:variable name="cenaBrutto" select="$cenaNetto + ($cenaNetto * 0.23)"/>
                        <xsl:value-of select='concat(format-number($cenaBrutto, "#.00"), " ", $waluta)'/>
                    </wartość-brutto>
                </element>
                <element>
                    <nazwa>Liczba bestselletów:</nazwa>
                    <liczba-bestsellerów>
                        <xsl:value-of select="count(tabela-płyt/płyty/płyta[@bestseller='true'])"/>
                    </liczba-bestsellerów>
                </element>
            </podsumowanie>
        </raport>
    </xsl:template>
</xsl:stylesheet>