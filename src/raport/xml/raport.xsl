<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="utf-8" indent="yes"/>

    <xsl:template match="/">
        <raport>
            <tytuł>Raport sprzedaży</tytuł>
            <xsl:for-each select="__ROOT__ /tabela-płyt/płyty/płyta">
                <płyta>
                    <wykonawca>
                        <xsl:value-of select="nazwa-wykonawcy"/>
                    </wykonawca>
                    <nazwa_płyty>
                        <xsl:value-of select="tytuł"/>
                    </nazwa_płyty>
                    <cena>
                        <xsl:attribute name="waluta">
                            <xsl:value-of select="cena/@waluta"/>
                        </xsl:attribute>
                        <xsl:value-of select="cena"/>
                    </cena>
                </płyta>
            </xsl:for-each>
        </raport>
    </xsl:template>
</xsl:stylesheet>