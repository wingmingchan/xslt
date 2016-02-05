<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:java="http://xml.apache.org/xalan/java" xmlns:javareflection="http://www.upstate.edu/chanw/javareflection" xmlns:stringmethods="http://www.upstate.edu/chanw/stringmethods">
    <xsl:include href="site://_common/formats/Upstate/library/java-string-methods"/>
    
    <xsl:output indent="yes" method="html"/>
    <xsl:template match="/">
        <br/>
        <br/>
        <strong>Testing charAt:</strong><br/>
        <xsl:call-template name="stringmethods:charAt">
            <xsl:with-param name="calling-object">hello</xsl:with-param>
            <xsl:with-param name="index">2</xsl:with-param>
        </xsl:call-template>, l
        <br/>
        
        <strong>Testing concat:</strong><br/>
        <xsl:call-template name="stringmethods:concat">
            <xsl:with-param name="calling-object">Hello</xsl:with-param>
            <xsl:with-param name="str"> World</xsl:with-param>
        </xsl:call-template>, Hello World
        <br/>
        
        <strong>Testing contains:</strong><br/>
        <xsl:call-template name="stringmethods:contains">
            <xsl:with-param name="calling-object">http://www.upstate.edu/cascade-admin/intra/format</xsl:with-param>
            <xsl:with-param name="str">/intra/</xsl:with-param>
        </xsl:call-template>, true
        <br/>
        <xsl:call-template name="stringmethods:contains">
            <xsl:with-param name="calling-object">http://www.upstate.edu/cascade-admin/intra/format</xsl:with-param>
            <xsl:with-param name="str">//web</xsl:with-param>
        </xsl:call-template>, false
        <br/>
        
        <strong>Testing endsWith:</strong><br/>
        <xsl:call-template name="stringmethods:endsWith">
            <xsl:with-param name="calling-object">http://www.upstate.edu/cascade-admin/intra/format</xsl:with-param>
            <xsl:with-param name="string">/format</xsl:with-param>
        </xsl:call-template>, true
        <br/>
        <xsl:call-template name="stringmethods:endsWith">
            <xsl:with-param name="calling-object">http://www.upstate.edu/cascade-admin/intra/format</xsl:with-param>
            <xsl:with-param name="suffix">/formats</xsl:with-param>
        </xsl:call-template>, false
        <br/>
        
        <strong>Testing equalsIgnoreCase:</strong><br/>
        <xsl:call-template name="stringmethods:equalsIgnoreCase">
            <xsl:with-param name="calling-object">FormatS</xsl:with-param>
            <xsl:with-param name="string">formats</xsl:with-param>
        </xsl:call-template>, true
        <br/>
        <xsl:call-template name="stringmethods:equalsIgnoreCase">
            <xsl:with-param name="calling-object">FormatS</xsl:with-param>
            <xsl:with-param name="string">formasS</xsl:with-param>
        </xsl:call-template>, false
        <br/>        
        <xsl:call-template name="stringmethods:equalsIgnoreCase">
            <xsl:with-param name="calling-object">FormatS</xsl:with-param>
            <xsl:with-param name="string">format</xsl:with-param>
        </xsl:call-template>, false
        <br/>
        
        <strong>Testing indexOf:</strong><br/>
        <xsl:call-template name="stringmethods:indexOf">
            <xsl:with-param name="calling-object">FormatS</xsl:with-param>
            <xsl:with-param name="charstring">t</xsl:with-param>
        </xsl:call-template>, 5
        <br/>        
        <xsl:call-template name="stringmethods:indexOf">
            <xsl:with-param name="calling-object">FormatS</xsl:with-param>
            <xsl:with-param name="charstring">orm</xsl:with-param>
        </xsl:call-template>, 1
        <br/>        
        <xsl:call-template name="stringmethods:indexOf">
            <xsl:with-param name="calling-object">FormatSFormatS</xsl:with-param>
            <xsl:with-param name="charstring">r</xsl:with-param>
            <xsl:with-param name="from">0</xsl:with-param>
        </xsl:call-template>, 2
        <br/>        
        <xsl:call-template name="stringmethods:indexOf">
            <xsl:with-param name="calling-object">FormatSFormatS</xsl:with-param>
            <xsl:with-param name="charstring">r</xsl:with-param>
            <xsl:with-param name="from">5</xsl:with-param>
        </xsl:call-template>, 9
        <br/>        
        <xsl:call-template name="stringmethods:indexOf">
            <xsl:with-param name="calling-object">FormatSFormatS</xsl:with-param>
            <xsl:with-param name="charstring">orm</xsl:with-param>
            <xsl:with-param name="from">0</xsl:with-param>
        </xsl:call-template>, 1
        <br/>        
        <xsl:call-template name="stringmethods:indexOf">
            <xsl:with-param name="calling-object">FormatSFormatS</xsl:with-param>
            <xsl:with-param name="charstring">orm</xsl:with-param>
            <xsl:with-param name="from">5</xsl:with-param>
        </xsl:call-template>, 8
        <br/>

        <strong>Testing lastIndexOf:</strong><br/>
        <xsl:call-template name="stringmethods:lastIndexOf">
            <xsl:with-param name="calling-object">FormatSFormatS</xsl:with-param>
            <xsl:with-param name="charstring">o</xsl:with-param>
        </xsl:call-template>, 8
        <br/>        
        <xsl:call-template name="stringmethods:lastIndexOf">
            <xsl:with-param name="calling-object">FormatSFormatS</xsl:with-param>
            <xsl:with-param name="charstring">o</xsl:with-param>
            <xsl:with-param name="from">5</xsl:with-param>
        </xsl:call-template>, 1
        <br/>
        <xsl:call-template name="stringmethods:lastIndexOf">
            <xsl:with-param name="calling-object">FormatSFormatS</xsl:with-param>
            <xsl:with-param name="charstring">o</xsl:with-param>
            <xsl:with-param name="from">10</xsl:with-param>
        </xsl:call-template>, 8
        <br/>        
        <xsl:call-template name="stringmethods:lastIndexOf">
            <xsl:with-param name="calling-object">FormatSFormatS</xsl:with-param>
            <xsl:with-param name="charstring">or</xsl:with-param>
        </xsl:call-template>, 8
        <br/>
        <xsl:call-template name="stringmethods:lastIndexOf">
            <xsl:with-param name="calling-object">FormatSFormatS</xsl:with-param>
            <xsl:with-param name="charstring">or</xsl:with-param>
            <xsl:with-param name="from">5</xsl:with-param>
        </xsl:call-template>, 1
        <br/>
        <xsl:call-template name="stringmethods:lastIndexOf">
            <xsl:with-param name="calling-object">FormatSFormatS</xsl:with-param>
            <xsl:with-param name="charstring">or</xsl:with-param>
            <xsl:with-param name="from">1</xsl:with-param>
        </xsl:call-template>, 1
        <br/>
        <xsl:call-template name="stringmethods:lastIndexOf">
            <xsl:with-param name="calling-object">FormatSFormatS</xsl:with-param>
            <xsl:with-param name="charstring">or</xsl:with-param>
            <xsl:with-param name="from">0</xsl:with-param>
        </xsl:call-template>, -1
        <br/>
        
        <strong>Testing matches:</strong><br/>
        <xsl:call-template name="stringmethods:matches">
            <xsl:with-param name="calling-object">FormatSFormatS</xsl:with-param>
            <xsl:with-param name="regex">F.*</xsl:with-param>
        </xsl:call-template>, true
        <br/>
        <xsl:call-template name="stringmethods:matches">
            <xsl:with-param name="calling-object">FormatSFormatS</xsl:with-param>
            <xsl:with-param name="regex">\s+</xsl:with-param>
        </xsl:call-template>, false
        <br/>
       
        <strong>Testing replaceFirst:</strong><br/>
        <xsl:call-template name="stringmethods:replaceFirst">
            <xsl:with-param name="calling-object">FormatSFormatS</xsl:with-param>
            <xsl:with-param name="regex">or</xsl:with-param>
            <xsl:with-param name="replacement">ar</xsl:with-param>
        </xsl:call-template>, FarmatSFormatS
        <br/>
        
        <strong>Testing startsWith:</strong><br/>
        <xsl:call-template name="stringmethods:startsWith">
            <xsl:with-param name="calling-object">FormatSFormatS</xsl:with-param>
            <xsl:with-param name="prefix">For</xsl:with-param>
        </xsl:call-template>, true
        <br/>
        <xsl:call-template name="stringmethods:startsWith">
            <xsl:with-param name="calling-object">FormatSFormatS</xsl:with-param>
            <xsl:with-param name="prefix">For</xsl:with-param>
            <xsl:with-param name="toffset">3</xsl:with-param>
        </xsl:call-template>, false
        <br/>
        <xsl:call-template name="stringmethods:startsWith">
            <xsl:with-param name="calling-object">FormatSFormatS</xsl:with-param>
            <xsl:with-param name="prefix">For</xsl:with-param>
            <xsl:with-param name="toffset">7</xsl:with-param>
        </xsl:call-template>, true
        <br/>
        <xsl:call-template name="stringmethods:startsWith">
            <xsl:with-param name="calling-object">FormatSFormatS</xsl:with-param>
            <xsl:with-param name="prefix">For</xsl:with-param>
            <xsl:with-param name="toffset">8</xsl:with-param>
        </xsl:call-template>, false
        <br/>

        <strong>Testing subSequence:</strong><br/>
        <xsl:call-template name="stringmethods:subSequence">
            <xsl:with-param name="calling-object">FormatSFormatS</xsl:with-param>
            <xsl:with-param name="beginIndex">3</xsl:with-param>
            <xsl:with-param name="endIndex">9</xsl:with-param>
        </xsl:call-template>, matSFo
        <br/>
        
        <strong>Testing substring:</strong><br/>
        <xsl:call-template name="stringmethods:substring">
            <xsl:with-param name="calling-object">FormatSFormatS</xsl:with-param>
            <xsl:with-param name="beginIndex">3</xsl:with-param>
        </xsl:call-template>, matSFormatS
        <br/>
        <xsl:call-template name="stringmethods:substring">
            <xsl:with-param name="calling-object">FormatSFormatS</xsl:with-param>
            <xsl:with-param name="beginIndex">3</xsl:with-param>
            <xsl:with-param name="endIndex">10</xsl:with-param>
        </xsl:call-template>, matSFor
        <br/>

        <strong>Testing replaceAll:</strong><br/>
        <xsl:call-template name="stringmethods:replaceAll">
            <xsl:with-param name="calling-object">abbbaabbbbbaabba</xsl:with-param>
            <xsl:with-param name="regex">ab+a</xsl:with-param>
            <xsl:with-param name="replacement">aba</xsl:with-param>
        </xsl:call-template>, abaabaaba
        <br/>
        
        <strong>Testing toLowerCase:</strong><br/>
        <xsl:call-template name="stringmethods:toLowerCase">
            <xsl:with-param name="calling-object">HelLO</xsl:with-param>
        </xsl:call-template>, hello
        <br/>

        <strong>Testing toUpperCase:</strong><br/>
        <xsl:call-template name="stringmethods:toUpperCase">
            <xsl:with-param name="calling-object">HelLO</xsl:with-param>
        </xsl:call-template>, HELLO
        <br/>

        <strong>Testing trim:</strong><br/>
        <xsl:call-template name="stringmethods:trim">
            <xsl:with-param name="calling-object">   Hey Jude    </xsl:with-param>
        </xsl:call-template>, Hey Jude
        <br/>        
    </xsl:template>    
</xsl:stylesheet>