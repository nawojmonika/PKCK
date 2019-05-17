<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ga="gatunek">
    <xsl:output method="xml" encoding="utf-8" indent="yes"/>
    <xsl:template match="/__ROOT__">
        <raport>
            <sprzedaż>
                <tytuł>Raport sprzedaży</tytuł>
                <xsl:for-each select="tabela-płyt/płyty/płyta">
                    <płyta>
                        <xsl:attribute name="gatunek">
                            <xsl:value-of select="ga:gatunek"/>
                        </xsl:attribute>
                        <sprzedaż>
                            <xsl:value-of select="zakup"/>
                        </sprzedaż>
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
                    <nazwa>Data wygenerowania raportu:</nazwa>
                    <data-wygenerowania>
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
                        <xsl:value-of select="count(gatunki//ga:gatunek)"/>
                    </liczba-gatunków>
                </element>
                <element>
                    <nazwa>Wartość netto:</nazwa>
                    <wartość-netto>
                        <xsl:variable name="cenaNetto"
                                      select="sum(tabela-płyt/płyty/płyta/cena)"/>
                        <xsl:value-of select='format-number($cenaNetto, "#.00")'/>
                    </wartość-netto>
                </element>
                <element>
                    <nazwa>Wartość brutto:</nazwa>
                    <wartość-brutto>
                        <xsl:variable name="cenaNetto"
                                      select="sum(tabela-płyt/płyty/płyta/cena)"/>
                        <xsl:variable name="cenaBrutto" select="$cenaNetto + ($cenaNetto * 0.23)"/>
                        <xsl:value-of select='format-number($cenaBrutto, "#.00")'/>
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