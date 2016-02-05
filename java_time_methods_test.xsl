<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:java="http://xml.apache.org/xalan/java"
    xmlns:reflectionmethods="http://www.upstate.edu/chanw/reflectionmethods"
    xmlns:timemethods="http://www.upstate.edu/chanw/timemethods">
    <xsl:include href="site://_common/formats/Upstate/library/java-time-methods"/>
    <xsl:output indent="yes" method="html"/>
    <xsl:template match="/">
        <br/>
        <br/>
        <strong>Testing convertDateDigitalStringToTimestamp with $datestring=2015-07-10 11:24:00.000</strong>
        <br/>
        <xsl:call-template name="timemethods:convertDateDigitalStringToTimestamp">
            <xsl:with-param name="datestring">2015-07-10 11:24:00.000</xsl:with-param>
        </xsl:call-template>
        <br/>
        <strong>Testing convertDateStringToTimestamp with $datestring=Jul 10, 2015 11:24 AM</strong>
        <br/>
        <xsl:call-template name="timemethods:convertDateStringToTimestamp">
            <xsl:with-param name="datestring">Jul 10, 2015 11:24 AM</xsl:with-param>
            <xsl:with-param name="format">MMM d, yyyy hh:mm aaa</xsl:with-param>
        </xsl:call-template>
        <br/>
        <strong>Testing convertDateStringToTimestamp with $datestring=2015-07-10 11:24:00.000</strong>
        <br/>
        <xsl:call-template name="timemethods:convertDateStringToTimestamp">
            <xsl:with-param name="datestring">2015-07-10 11:24:00.000</xsl:with-param>
            <xsl:with-param name="format">yyyy-MM-dd hh:mm:ss.000</xsl:with-param>
        </xsl:call-template>
        <br/>
        <strong>Testing convertTimestampToDateCharString</strong>
        <br/>
        <xsl:call-template name="timemethods:convertTimestampToDateCharString">
            <xsl:with-param name="timestamp">1436541840000</xsl:with-param>
        </xsl:call-template>
        <br/>
        <strong>Testing convertTimestampToFormattedString without format string</strong>
        <br/>
        <xsl:call-template name="timemethods:convertTimestampToFormattedString">
            <xsl:with-param name="timestamp">1436541840000</xsl:with-param>
        </xsl:call-template>
        <br/>
        <strong>Testing convertTimestampToFormattedString with $format=EEE, d MMM yyyy</strong>
        <br/>
        <xsl:call-template name="timemethods:convertTimestampToFormattedString">
            <xsl:with-param name="timestamp">1436541840000</xsl:with-param>
            <xsl:with-param name="format">EEE, d MMM yyyy</xsl:with-param>
        </xsl:call-template>
        <br/>
        <strong>Testing convertTimestampToFormattedString with $format=yyyy-MM-dd HH:mm:ss.000</strong>
        <br/>
        <xsl:call-template name="timemethods:convertTimestampToFormattedString">
            <xsl:with-param name="timestamp">1436541840000</xsl:with-param>
            <xsl:with-param name="format">yyyy-MM-dd HH:mm:ss.000</xsl:with-param>
        </xsl:call-template>
        <br/>
        <strong>Getting the current timestamp</strong>
        <br/>
        <xsl:variable name="now">
            <xsl:call-template name="timemethods:getCurrentTimestamp"/>
        </xsl:variable>
        <xsl:value-of select="$now"/>
        <br/>
        <strong>Getting just the year</strong>
        <br/>
        <xsl:call-template name="timemethods:convertTimestampToFormattedString">
            <xsl:with-param name="timestamp">
                <xsl:value-of select="$now"/>
            </xsl:with-param>
            <xsl:with-param name="format">yyyy</xsl:with-param>
        </xsl:call-template>
        <br/>
        <strong>Getting just the month</strong>
        <br/>
        <xsl:call-template name="timemethods:convertTimestampToFormattedString">
            <xsl:with-param name="timestamp">
                <xsl:value-of select="$now"/>
            </xsl:with-param>
            <xsl:with-param name="format">MM</xsl:with-param>
        </xsl:call-template>
        <br/>
        <strong>Getting just the day</strong>
        <br/>
        <xsl:call-template name="timemethods:convertTimestampToFormattedString">
            <xsl:with-param name="timestamp">
                <xsl:value-of select="$now"/>
            </xsl:with-param>
            <xsl:with-param name="format">dd</xsl:with-param>
        </xsl:call-template>
        <br/>
        <strong>Getting the timestamp three years ago</strong>
        <br/>
        <xsl:variable name="three-years-ago-timestamp">
            <xsl:call-template name="timemethods:getTimestamp">
                <xsl:with-param name="field">
                    <xsl:call-template name="reflectionmethods:getStaticClassField">
                        <xsl:with-param name="class-name">java.util.GregorianCalendar</xsl:with-param>
                        <xsl:with-param name="field-name">YEAR</xsl:with-param>
                    </xsl:call-template>
                </xsl:with-param>
                <xsl:with-param name="amount">3</xsl:with-param>
                <xsl:with-param name="sign">-</xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <xsl:value-of select="$three-years-ago-timestamp"/>
        <br/>
        <strong>Testing timestamp back to date</strong>
        <br/>
        <xsl:call-template name="timemethods:convertTimestampToFormattedString">
            <xsl:with-param name="timestamp">
                <xsl:value-of select="$three-years-ago-timestamp"/>
            </xsl:with-param>
            <xsl:with-param name="format">yyyy-MM-dd HH:mm:ss.000</xsl:with-param>
        </xsl:call-template>
        <br/>
        <strong>Getting the timestamp two months in the future</strong>
        <br/>
        <xsl:variable name="two-month-future-timestamp">
            <xsl:call-template name="timemethods:getTimestamp">
                <xsl:with-param name="field">
                    <xsl:call-template name="reflectionmethods:getStaticClassField">
                        <xsl:with-param name="class-name">java.util.GregorianCalendar</xsl:with-param>
                        <xsl:with-param name="field-name">MONTH</xsl:with-param>
                    </xsl:call-template>
                </xsl:with-param>
                <xsl:with-param name="amount">2</xsl:with-param>
                <xsl:with-param name="sign">+</xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <xsl:value-of select="$two-month-future-timestamp"/>
        <br/>
        <strong>Testing timestamp back to date</strong>
        <br/>
        <xsl:call-template name="timemethods:convertTimestampToFormattedString">
            <xsl:with-param name="timestamp">
                <xsl:value-of select="$two-month-future-timestamp"/>
            </xsl:with-param>
            <xsl:with-param name="format">yyyy-MM-dd HH:mm:ss.000</xsl:with-param>
        </xsl:call-template>
        <br/>
        <strong>Getting the timestamp three years ago, starting from July 10, 2015</strong>
        <br/>
        <xsl:variable name="three-years-before-july-ten-timestamp">
            <xsl:call-template name="timemethods:getTimestamp">
                <xsl:with-param name="field">
                    <xsl:call-template name="reflectionmethods:getStaticClassField">
                        <xsl:with-param name="class-name">java.util.GregorianCalendar</xsl:with-param>
                        <xsl:with-param name="field-name">YEAR</xsl:with-param>
                    </xsl:call-template>
                </xsl:with-param>
                <xsl:with-param name="amount">3</xsl:with-param>
                <xsl:with-param name="sign">-</xsl:with-param>
                <xsl:with-param name="start">
                    <xsl:value-of select="1436541840000"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <xsl:value-of select="$three-years-before-july-ten-timestamp"/>
        <br/>
        <strong>Testing timestamp back to date</strong>
        <br/>
        <xsl:call-template name="timemethods:convertTimestampToFormattedString">
            <xsl:with-param name="timestamp">
                <xsl:value-of select="$three-years-before-july-ten-timestamp"/>
            </xsl:with-param>
            <xsl:with-param name="format">yyyy-MM-dd HH:mm:ss.000</xsl:with-param>
        </xsl:call-template>
        <br/>
        <strong>Testing timemethods:getTimestamp with no parameters</strong>
        <br/>
        <xsl:call-template name="timemethods:getTimestamp"></xsl:call-template>
        <br/>
    </xsl:template>
</xsl:stylesheet>