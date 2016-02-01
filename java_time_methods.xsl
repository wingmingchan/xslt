<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="java timemethods" version="1.0"
    xmlns:java="http://xml.apache.org/xalan/java"
    xmlns:reflectionmethods="http://www.upstate.edu/chanw/reflectionmethods"
    xmlns:timemethods="http://www.upstate.edu/chanw/timemethods">
    <xsl:include href="site://_common/formats/Upstate/library/java-reflection-methods"/>
    <xsl:output indent="yes" method="html"/>
    <xsl:template name="timemethods:convertDateDigitalStringToTimestamp">
        <!-- yyyy-MM-dd HH:mm:ss.000 -->
        <xsl:param name="datestring"/>
        <xsl:value-of select="java:getTimeInMillis(java:java.util.GregorianCalendar.new(java:substring($datestring,0,4),java:substring($datestring,5,7) - 1,java:substring($datestring,8,10),java:substring($datestring,11,13),java:substring($datestring,14,16),java:substring($datestring,17,19)))"/>
    </xsl:template>
    <xsl:template name="timemethods:convertDateStringToTimestamp">
        <!-- format gives the pattern of the input date string -->
        <xsl:param name="datestring"/>
        <!-- Jul 6, 2015 12:00 AM -->
        <xsl:param name="format"/>
        <!-- MMM d, yyyy hh:mm aaa -->
        <xsl:variable name="normalized-date">
            <!-- output format: Mon Jul 06 00:00:00 EDT 2015 -->
            <xsl:value-of select="java:parse(java:java.text.SimpleDateFormat.new($format),$datestring)"/>
        </xsl:variable>
        <!-- the two-digit month -->
        <xsl:variable name="monthstring">
            <xsl:value-of select="java:substring($normalized-date,4,7)"/>
        </xsl:variable>
        <!-- convert to string -->
        <xsl:variable name="month">
            <xsl:choose>
                <xsl:when test="$monthstring='Jan'">0</xsl:when>
                <xsl:when test="$monthstring='Feb'">1</xsl:when>
                <xsl:when test="$monthstring='Mar'">2</xsl:when>
                <xsl:when test="$monthstring='Apr'">3</xsl:when>
                <xsl:when test="$monthstring='May'">4</xsl:when>
                <xsl:when test="$monthstring='Jun'">5</xsl:when>
                <xsl:when test="$monthstring='Jul'">6</xsl:when>
                <xsl:when test="$monthstring='Aug'">7</xsl:when>
                <xsl:when test="$monthstring='Sep'">8</xsl:when>
                <xsl:when test="$monthstring='Oct'">9</xsl:when>
                <xsl:when test="$monthstring='Nov'">10</xsl:when>
                <xsl:when test="$monthstring='Dec'">11</xsl:when>
            </xsl:choose>
        </xsl:variable>
        <!-- calculate the timestamp -->
        <xsl:value-of select="java:getTimeInMillis(java:java.util.GregorianCalendar.new(java:substring($normalized-date,24),$month,java:substring($normalized-date,8,10),java:substring($normalized-date,11,13),java:substring($normalized-date,14,16),java:substring($normalized-date,17,19)))"/>
    </xsl:template>
    <xsl:template name="timemethods:convertTimestampToDateCharString">
        <xsl:param name="timestamp"/>
        <!-- whatever output by Date -->
        <xsl:value-of select="java:java.util.Date.new($timestamp div 1)"/>
    </xsl:template>
    <xsl:template name="timemethods:convertTimestampToFormattedString">
        <xsl:param name="timestamp"/>
        <!-- the desired format -->
        <xsl:param name="format"/>
        <xsl:choose>
            <xsl:when test="$format">
                <xsl:variable name="dateFormat" select="java:java.text.SimpleDateFormat.getDateTimeInstance()"/>
                <xsl:variable name="void" select="java:applyPattern($dateFormat,$format)"/>
                <xsl:value-of select="java:format($dateFormat,java:java.util.Date.new($timestamp div 1))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="java:format(java:java.text.DateFormat.getInstance(),java:java.util.Date.new($timestamp div 1))"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- now -->
    <xsl:template name="timemethods:getCurrentTimestamp">
        <xsl:value-of select="java:getTimeInMillis(java:java.util.GregorianCalendar.new())"/>
    </xsl:template>
    <xsl:template name="timemethods:getTimestamp">
        <!-- the difference is roughly calculated: 365 days a year, 30 days a month -->
        <!-- GregorianCalendar.YEAR, GregorianCalendar.MONTH, or GregorianCalendar.DATE -->
        <!-- defaulted to 0, doing nothing -->
        <xsl:param name="field"/>
        <!-- an integer, defaulted to 0 -->
        <xsl:param name="amount"/>
        <!-- + or -, + for forward, - for backward, defaulted to + -->
        <xsl:param name="sign"/>
        <!-- the starting timestamp, defaulted to now -->
        <xsl:param name="start"/>
        <xsl:variable name="fieldadjusted">
            <xsl:choose>
                <xsl:when test="$field">
                    <xsl:value-of select="$field"/>
                </xsl:when>
                <xsl:otherwise>0</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="amountadjusted">
            <xsl:choose>
                <xsl:when test="$amount">
                    <xsl:value-of select="$amount"/>
                </xsl:when>
                <xsl:otherwise>0</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="signadjusted">
            <xsl:choose>
                <xsl:when test="$sign and $sign='-'">
                    <xsl:value-of select="$sign"/>
                </xsl:when>
                <xsl:otherwise>+</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="now">
            <xsl:value-of select="java:getTimeInMillis(java:java.util.GregorianCalendar.new())"/>
        </xsl:variable>
        <xsl:variable name="startadjusted">
            <xsl:choose>
                <xsl:when test="$start">
                    <xsl:value-of select="$start div 1"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$now"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="yearvalue">
            <xsl:call-template name="reflectionmethods:getStaticClassField">
                <xsl:with-param name="class-name">java.util.GregorianCalendar</xsl:with-param>
                <xsl:with-param name="field-name">YEAR</xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="monthvalue">
            <xsl:call-template name="reflectionmethods:getStaticClassField">
                <xsl:with-param name="class-name">java.util.GregorianCalendar</xsl:with-param>
                <xsl:with-param name="field-name">MONTH</xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="datevalue">
            <xsl:call-template name="reflectionmethods:getStaticClassField">
                <xsl:with-param name="class-name">java.util.GregorianCalendar</xsl:with-param>
                <xsl:with-param name="field-name">DATE</xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <!-- rough calculation of days, months, or years, into milliseconds -->
        <xsl:variable name="difference">
            <xsl:choose>
                <xsl:when test="$field=$yearvalue">
                    <xsl:value-of select="$amount*365*24*60*60*1000"/>
                </xsl:when>
                <xsl:when test="$field=$monthvalue">
                    <xsl:value-of select="$amount*30*24*60*60*1000"/>
                </xsl:when>
                <xsl:when test="$field=$datevalue">
                    <xsl:value-of select="$amount*24*60*60*1000"/>
                </xsl:when>
                <xsl:otherwise>0</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <!-- the difference between now and starting timestamp -->
        <xsl:variable name="difference2">
            <xsl:value-of select="$now div 1 - $startadjusted"/>
        </xsl:variable>
        <!-- calculate the timestamp -->
        <xsl:choose>
            <xsl:when test="$signadjusted='+'">
                <xsl:value-of select="$now + $difference - $difference2"/>
            </xsl:when>
            <xsl:when test="$signadjusted='-'">
                <xsl:value-of select="$now - $difference - $difference2"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>