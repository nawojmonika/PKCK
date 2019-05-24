<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ga="gatunek">
    <xsl:output method="text" encoding="utf-8" indent="yes"/>
    <xsl:template match="/raport">
        <xsl:variable name="enter" select="'&#13;'"/>
        <xsl:value-of select="sprzedaż/tytuł"/>
        <xsl:value-of select="$enter"/>

        <xsl:variable name="maxWidth">
            <xsl:for-each select="sprzedaż/płyta/*">
                <xsl:sort select="string-length(child::text()|child::node())" order="descending" data-type="number"/>
                <xsl:if test="position() = 1">
                    <xsl:value-of select="string-length(child::text()|child::node())"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>


        <!--Header-->
        <xsl:for-each select="distinct-values(sprzedaż/płyta/*/name())">
            <xsl:variable name="string">
                <xsl:value-of select="."/>
            </xsl:variable>
            <xsl:variable name="padding">
                <xsl:call-template name="get-padding-value">
                    <xsl:with-param name="maxWidth" select="$maxWidth"/>
                    <xsl:with-param name="stringLength" select="string-length($string)"/>
                </xsl:call-template>
            </xsl:variable>
            <xsl:value-of select="$string"/>
            <xsl:call-template name="append-pad">
                <xsl:with-param name="length" select="$padding"/>
            </xsl:call-template>
            <xsl:text>&#32;</xsl:text>
        </xsl:for-each>
        <xsl:value-of select="$enter"/>
        <!--Body-->
        <xsl:for-each select="sprzedaż/płyta">
            <xsl:for-each select="*">
                <xsl:variable name="string">
                    <xsl:for-each select="child::text()|child::node()">
                        <xsl:value-of select="."/>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:variable name="padding">
                    <xsl:call-template name="get-padding-value">
                        <xsl:with-param name="maxWidth" select="$maxWidth"/>
                        <xsl:with-param name="stringLength" select="string-length($string)"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:value-of select="$string"/>
                <xsl:call-template name="append-pad">
                    <xsl:with-param name="length" select="$padding"/>
                </xsl:call-template>
                <xsl:text>&#32;</xsl:text>
            </xsl:for-each>
            <xsl:value-of select="$enter"/>
        </xsl:for-each>
        <!--<xsl:variable name="nodeNames" select="distinct-values(sprzedaż/płyta/*/name())"/>-->
        <!--<xsl:variable name="attrNames" select="distinct-values(sprzedaż/płyta/@*/name())"/>-->

        <!--<xsl:value-of select="$nodeNames"/>-->
        <!--<xsl:value-of select="'&#32;'"/>-->
        <!--<xsl:value-of select="$attrNames"/>-->

        <!--<xsl:value-of select="$enter"/>-->
        <!--<xsl:for-each select="sprzedaż/płyta">-->
            <!--<xsl:value-of select="*"/>-->
            <!--<xsl:value-of select="concat(' ', @gatunek )"/>-->
            <!--<xsl:value-of select="$enter"/>-->
        <!--</xsl:for-each>-->
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="podsumowanie/tytuł"/>
        <xsl:value-of select="$enter"/>
        <xsl:for-each select="podsumowanie/element">
            <xsl:value-of select="concat(nazwa, ' ')"/>
        </xsl:for-each>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="podsumowanie/element/*[not(self::nazwa)]"/>
    </xsl:template>

    <xsl:template name="get-padding-value">
        <xsl:param name="maxWidth" select="0"/>
        <xsl:param name="stringLength" select="0"/>
        <xsl:value-of select="$maxWidth - $stringLength"/>
    </xsl:template>

    <xsl:template name="append-pad">
        <xsl:param name="length" select="0"/>
        <xsl:if test="$length != 0">
            <xsl:value-of select="'&#32;'"/>
            <xsl:call-template name="append-pad">
                <xsl:with-param name="length" select="$length - 1"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>