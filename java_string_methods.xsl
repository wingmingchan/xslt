<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="java stringmethods" version="1.0"
    xmlns:java="http://xml.apache.org/xalan/java"
    xmlns:stringmethods="http://www.upstate.edu/chanw/stringmethods">
    <xsl:output indent="yes" method="html"/>
    <xsl:template name="stringmethods:charAt">
        <xsl:param name="calling-object"/>
        <xsl:param name="index"/>
        <xsl:value-of select="java:charAt($calling-object,$index)"/>
    </xsl:template>
    <xsl:template name="stringmethods:concat">
        <xsl:param name="calling-object"/>
        <xsl:param name="str"/>
        <xsl:value-of select="java:concat($calling-object,$str)"/>
    </xsl:template>
    <xsl:template name="stringmethods:contains">
        <xsl:param name="calling-object"/>
        <xsl:param name="str"/>
        <!-- does not accept java:contains -->
        <xsl:value-of select="java:toString(java:java.lang.Boolean.new(contains($calling-object,$str)))"/>
    </xsl:template>
    <xsl:template name="stringmethods:endsWith">
        <xsl:param name="calling-object"/>
        <xsl:param name="suffix"/>
        <xsl:value-of select="java:toString(java:java.lang.Boolean.new(java:endsWith($calling-object,$suffix)))"/>
    </xsl:template>
    <xsl:template name="stringmethods:equalsIgnoreCase">
        <xsl:param name="calling-object"/>
        <xsl:param name="string"/>
        <xsl:value-of select="java:toString(java:java.lang.Boolean.new(java:equalsIgnoreCase($calling-object,$string)))"/>
    </xsl:template>
    <xsl:template name="stringmethods:indexOf">
        <xsl:param name="calling-object"/>
        <xsl:param name="charstring"/>
        <xsl:param name="from"/>
        <xsl:choose>
            <xsl:when test="$from">
                <xsl:value-of select="java:indexOf($calling-object,$charstring,$from)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="java:indexOf($calling-object,$charstring)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="stringmethods:lastIndexOf">
        <xsl:param name="calling-object"/>
        <xsl:param name="charstring"/>
        <xsl:param name="from"/>
        <xsl:choose>
            <xsl:when test="$from">
                <xsl:value-of select="java:lastIndexOf($calling-object,$charstring,$from)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="java:lastIndexOf($calling-object,$charstring)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="stringmethods:length">
        <xsl:param name="calling-object"/>
        <xsl:value-of select="java:length($calling-object)"/>
    </xsl:template>
    <xsl:template name="stringmethods:matches">
        <xsl:param name="calling-object"/>
        <xsl:param name="regex"/>
        <xsl:value-of select="java:toString(java:java.lang.Boolean.new(java:matches($calling-object,$regex)))"/>
    </xsl:template>
    <xsl:template name="stringmethods:replaceFirst">
        <xsl:param name="calling-object"/>
        <xsl:param name="regex"/>
        <xsl:param name="replacement"/>
        <xsl:value-of select="java:replaceFirst($calling-object,$regex,$replacement)"/>
    </xsl:template>
    <xsl:template name="stringmethods:startsWith">
        <xsl:param name="calling-object"/>
        <xsl:param name="prefix"/>
        <xsl:param name="toffset"/>
        <xsl:choose>
            <xsl:when test="$toffset">
                <xsl:value-of select="java:toString(java:java.lang.Boolean.new(java:startsWith($calling-object,$prefix,$toffset)))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="java:toString(java:java.lang.Boolean.new(java:startsWith($calling-object,$prefix)))"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="stringmethods:subSequence">
        <xsl:param name="calling-object"/>
        <xsl:param name="beginIndex"/>
        <xsl:param name="endIndex"/>
        <xsl:value-of select="java:subSequence($calling-object,$beginIndex,$endIndex)"/>
    </xsl:template>
    <xsl:template name="stringmethods:substring">
        <xsl:param name="calling-object"/>
        <xsl:param name="beginIndex"/>
        <xsl:param name="endIndex"/>
        <xsl:choose>
            <xsl:when test="$endIndex">
                <xsl:value-of select="java:substring($calling-object,$beginIndex,$endIndex)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="java:substring($calling-object,$beginIndex)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="stringmethods:replaceAll">
        <xsl:param name="calling-object"/>
        <xsl:param name="regex"/>
        <xsl:param name="replacement"/>
        <xsl:value-of select="java:replaceAll($calling-object,$regex,$replacement)"/>
    </xsl:template>
    <xsl:template name="stringmethods:toLowerCase">
        <xsl:param name="calling-object"/>
        <xsl:value-of select="java:toLowerCase($calling-object)"/>
    </xsl:template>
    <xsl:template name="stringmethods:toUpperCase">
        <xsl:param name="calling-object"/>
        <xsl:value-of select="java:toUpperCase($calling-object)"/>
    </xsl:template>
    <xsl:template name="stringmethods:trim">
        <xsl:param name="calling-object"/>
        <xsl:value-of select="java:trim($calling-object)"/>
    </xsl:template>
</xsl:stylesheet>