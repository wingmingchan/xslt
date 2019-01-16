<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" extension-element-prefixes="node" version="1.0"
	xmlns:countsubstring="http://www.upstate.edu/chanw/countsubstring"
	xmlns:node="http://www.upstate.edu/chanw/node"
	xmlns:startswith="http://www.upstate.edu/chanw/startswith"
	xmlns:stringmethods="http://www.upstate.edu/chanw/stringmethods"
	xmlns:substringafterlast="http://www.upstate.edu/chanw/substringafterlast">
	<xsl:include href="site://_brisk/core/library/xslt/string-substring-after-last"/>
	<xsl:include href="site://_brisk/core/library/xslt/string-starts-with"/>
	<xsl:include href="site://_brisk/core/library/xslt/string-count-substring"/>
	<xsl:include href="site://_brisk/core/library/xslt/java-string-methods"/>
	<!-- 
    Pages where these icons are used:
    http://www.upstate.edu/biochem/education/ms_degree.php
    http://www.upstate.edu/currentstudents/support/disabilities/index.php
    -->
	<xsl:variable name="external-icon">[system-asset:id=40da11a88b7f085600ebf23e05daf386]site://Upstate-Globals/assets/images/icons/external-icon.gif[/system-asset]</xsl:variable>
	<xsl:variable name="key-icon">[system-asset:id=40da12348b7f085600ebf23e54241ad6]site://Upstate-Globals/assets/images/icons/key-icon.gif[/system-asset]</xsl:variable>
	<xsl:variable name="pdf-icon">[system-asset:id=40da132f8b7f085600ebf23e45539f84]site://Upstate-Globals/assets/images/icons/pdf-icon.gif[/system-asset]</xsl:variable>
	<xsl:variable name="word-icon">[system-asset:id=40da13a58b7f085600ebf23e348256c0]site://Upstate-Globals/assets/images/icons/word-icon.gif[/system-asset]</xsl:variable>
	<xsl:variable name="excel-icon">[system-asset:id=40da10db8b7f085600ebf23e4d324277]site://Upstate-Globals/assets/images/icons/excel-icon.gif[/system-asset]</xsl:variable>
	<xsl:variable name="swf-icon">[system-asset:id=5b1332818b7f0856001b8902d4108705]site://Upstate-Globals/assets/images/icons/swf-icon.gif[/system-asset]</xsl:variable>
	<xsl:template name="node:process-a">
		<xsl:param name="node"/>
		<xsl:param name="right-column"/>
		<!-- store the href -->
		<xsl:variable name="href">
			<xsl:value-of select="@href"/>
		</xsl:variable>
		<!-- check if the url points to pdf -->
		<xsl:variable name="pdf">
			<xsl:call-template name="substringafterlast:substringAfterLast">
				<xsl:with-param name="text">
					<xsl:value-of select="$href"/>
				</xsl:with-param>
				<xsl:with-param name="chars">.</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<!-- check if the url points to word -->
		<xsl:variable name="word">
			<xsl:call-template name="substringafterlast:substringAfterLast">
				<xsl:with-param name="text">
					<xsl:value-of select="$href"/>
				</xsl:with-param>
				<xsl:with-param name="chars">.</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<!-- check if the url points to excel -->
		<xsl:variable name="excel">
			<xsl:call-template name="substringafterlast:substringAfterLast">
				<xsl:with-param name="text">
					<xsl:value-of select="$href"/>
				</xsl:with-param>
				<xsl:with-param name="chars">.</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<!-- check if the url points to swf -->
		<xsl:variable name="swf">
			<xsl:call-template name="substringafterlast:substringAfterLast">
				<xsl:with-param name="text">
					<xsl:value-of select="$href"/>
				</xsl:with-param>
				<xsl:with-param name="chars">.</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<!-- check if the url points to intra -->
		<xsl:variable name="intra">
			<xsl:call-template name="stringmethods:contains">
				<xsl:with-param name="calling-object">
					<xsl:value-of select="$href"/>
				</xsl:with-param>
				<xsl:with-param name="str">/intra/</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<!-- check if the url points to external -->
		<xsl:variable name="external">
			<xsl:variable name="count-http">
				<xsl:call-template name="countsubstring:countSubstring">
					<xsl:with-param name="text">
						<xsl:value-of select="$href"/>
					</xsl:with-param>
					<xsl:with-param name="chars">http://</xsl:with-param>
				</xsl:call-template>
			</xsl:variable>
			<xsl:variable name="count-https">
				<xsl:call-template name="countsubstring:countSubstring">
					<xsl:with-param name="text">
						<xsl:value-of select="$href"/>
					</xsl:with-param>
					<xsl:with-param name="chars">https://</xsl:with-param>
				</xsl:call-template>
			</xsl:variable>
			<xsl:variable name="count-upstate">
				<xsl:call-template name="countsubstring:countSubstring">
					<xsl:with-param name="text">
						<xsl:value-of select="$href"/>
					</xsl:with-param>
					<xsl:with-param name="chars">upstate.edu</xsl:with-param>
				</xsl:call-template>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="$count-http=1 and $count-upstate=0">
					<xsl:text>external</xsl:text>
				</xsl:when>
				<xsl:when test="$count-https=1 and $count-upstate=0">
					<xsl:text>external</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>internal</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<a>
			<xsl:apply-templates select="@*|node()"/>
			<xsl:if test="$pdf='pdf'">
				<!-- <xsl:text></xsl:text> -->
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="$pdf-icon"/>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:text>PDF Icon</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="class">
						<xsl:text>icon</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:text>PDF Document</xsl:text>
					</xsl:attribute>
				</img>
			</xsl:if>
			<xsl:if test="$word='doc' or $word='docx'">
				<!-- <xsl:text></xsl:text> -->
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="$word-icon"/>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:text>Word Icon</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="class">
						<xsl:text>icon</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:text>Word Document</xsl:text>
					</xsl:attribute>
				</img>
			</xsl:if>
			<xsl:if test="$intra='true'">
				<!-- <xsl:text></xsl:text> -->
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="$key-icon"/>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:text>Intranet Icon</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="class">
						<xsl:text>icon</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:text>Intranet</xsl:text>
					</xsl:attribute>
				</img>
			</xsl:if>
			<xsl:if test="$excel='xls' or $excel='xlsx'">
				<!-- <xsl:text></xsl:text> -->
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="$excel-icon"/>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:text>Excel Icon</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="class">
						<xsl:text>icon</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:text>Excel Document</xsl:text>
					</xsl:attribute>
				</img>
			</xsl:if>
			<xsl:if test="$swf='swf'">
				<!-- <xsl:text></xsl:text> -->
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="$swf-icon"/>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:text>SWF Icon</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="class">
						<xsl:text>icon</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:text>Flash Document</xsl:text>
					</xsl:attribute>
				</img>
			</xsl:if>
			<xsl:if test="$external='external'">
				<!-- <xsl:text></xsl:text> -->
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="$external-icon"/>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:text>External Icon</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="class">
						<xsl:text>icon</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:text>External Link</xsl:text>
					</xsl:attribute>
				</img>
			</xsl:if>
		</a>
	</xsl:template>
	<xsl:template name="node:process-tag">
		<xsl:param name="text"/>
		<xsl:param name="replace"/>
		<xsl:param name="with"/>
		<xsl:variable name="count">
			<xsl:call-template name="countsubstring:countSubstring">
				<xsl:with-param name="text" select="$text"/>
				<xsl:with-param name="chars" select="$replace"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:choose>
			<!-- nothing to replace -->
			<xsl:when test="string-length($replace) = 0">
				<xsl:value-of select="$text"/>
			</xsl:when>
			<xsl:when test="$count=0">
				<xsl:value-of select="$text"/>
			</xsl:when>
			<xsl:when test="$count=1">
				<xsl:variable name="part1" select="substring-before($text, $replace)"/>
				<xsl:variable name="part2" select="substring-after($text, $replace)"/>
				<xsl:value-of select="$part1"/>
				<xsl:value-of disable-output-escaping="yes" select="$with"/>
				<xsl:value-of select="$part2"/>
			</xsl:when>
			<xsl:when test="$count=2">
				<xsl:variable name="part1" select="substring-before($text, $replace)"/>
				<xsl:variable name="after" select="substring-after($text, $replace)"/>
				<xsl:variable name="part2" select="substring-before($after, $replace)"/>
				<xsl:variable name="part3" select="substring-after($after, $replace)"/>
				<xsl:value-of select="$part1"/>
				<xsl:value-of disable-output-escaping="yes" select="$with"/>
				<xsl:value-of select="$part2"/>
				<xsl:value-of disable-output-escaping="yes" select="$with"/>
				<xsl:value-of select="$part3"/>
			</xsl:when>
			<xsl:when test="$count=3">
				<xsl:variable name="part1" select="substring-before($text, $replace)"/>
				<xsl:variable name="after1" select="substring-after($text, $replace)"/>
				<xsl:variable name="part2" select="substring-before($after1, $replace)"/>
				<xsl:variable name="after2" select="substring-after($after1, $replace)"/>
				<xsl:variable name="part3" select="substring-before($after2, $replace)"/>
				<xsl:variable name="part4" select="substring-after($after2, $replace)"/>
				<xsl:value-of select="$part1"/>
				<xsl:value-of disable-output-escaping="yes" select="$with"/>
				<xsl:value-of select="$part2"/>
				<xsl:value-of disable-output-escaping="yes" select="$with"/>
				<xsl:value-of select="$part3"/>
				<xsl:value-of disable-output-escaping="yes" select="$with"/>
				<xsl:value-of select="$part4"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>