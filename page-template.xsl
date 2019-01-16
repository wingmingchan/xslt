<!--#*doc
<documentation><h2>Introduction</h2><p>This is the template-level XSLT format attached to the configuration set named Page.</p><h2>Templates and Parts</h2><ul><li>xsl:variable name="hide-elements": defines all elements to be hidden</li><li>template match="comment()[contains(., '#*doc')]: hides the documentation of a template from the page source</li><li>template match="system-region": hides the <code>system-region</code> tags</li><li>template match="html[not(@lang)]": adds PHP code before the html start tag</li><li>template match="@*|node()": the identity template that also deals with hiding and showing elements</li><li>template match="head//text()|body//text()[not(ancestor::pre) and not(ancestor::script)]|system-region//text()[not(ancestor::pre) and not(ancestor::script)]|nav//text()": removes excessive newlines and space characters</li><li>template match="//a[ancestor::div[@id='page-content-div']][not(img) and not(div)][not(following-sibling::img)]": inserts icons to links</li></ul></documentation>
doc*###-->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="xalan java" version="1.0"
	xmlns:java="http://xml.apache.org/xalan/java"
	xmlns:me="stylesheet"
	xmlns:node="http://www.upstate.edu/chanw/node"
	xmlns:xalan="http://xml.apache.org/xalan">
	<!-- 20181017 - drulykg - Icon node processing replaced by Velocity -->
	<!-- <xsl:include href="site://_brisk/core/library/xslt/node-processing"/> -->
	<xsl:output encoding="UTF-8" indent="yes" method="html"/>
	<!-- add elements to be hidden and shown here -->
	<xsl:variable name="hide-elements">
		<!-- these are for displaying code in wysiwyg -->
		<element id="code1" name="div"></element>
		<element id="code2" name="div"></element>
		<element id="code3" name="div"></element>
		<element id="code4" name="div"></element>
		<element id="code5" name="div"></element>
		<element id="code6" name="div"></element>
		<element id="code7" name="div"></element>
		<element id="code8" name="div"></element>
		<element id="code9" name="div"></element>
		<element id="code10" name="div"></element>
		<!-- this element shows up in head, before page-level-override -->
		<element id="master-level-override" name="div"></element>
		<!-- this element shows up in head, right before the end tag of head -->
		<element id="page-level-override" name="div"></element>
		<!-- these are zones defined in the default format -->
		<element id="zone1" name="div"></element>
		<!-- between header and site nav -->
		<element id="zone2" name="div"></element>
		<!-- between site nav and breadcrumbs -->
		<element id="zone3" name="div"></element>
		<!-- between breadcrumbs and page contents -->
		<element id="zone4" name="div"></element>
		<!-- below footer -->
	</xsl:variable>
	<!-- remove documentation comment -->
	<xsl:template match="comment()[contains(., '#*doc')]"/>
	<xsl:template match="system-region">
		<div>
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	<!-- remove root div -->
	<xsl:template match="/div">
		<xsl:apply-templates select="@*|node()"/>
	</xsl:template>
	<!-- add php code -->
	<xsl:template match="html[not(@lang)]">
		<!--<xsl:processing-instruction name="php">require_once('cascade/cascade_global.php');$responsive = true;</xsl:processing-instruction>-->
		<html lang="en-US">
			<xsl:apply-templates select="@*|node()"/>
		</html>
	</xsl:template>
	<xsl:template match="/div/cascadeForcedRoot">
		<cascadeForcedRoot>
			<xsl:apply-templates select="@*|node()"/>
		</cascadeForcedRoot>
	</xsl:template>
	<!-- hide/show mechanism -->
	<xsl:template match="@*|node()" priority="-1">
		<xsl:variable name="name" select="name(.)"/>
		<xsl:variable name="id" select="@id"/>
		<!-- hide-whatever -->
		<xsl:variable name="hideid" select="concat('hide-', substring-after(@id, 'show-'))"/>
		<!-- content of hide-whatever -->
		<xsl:variable name="hidden" select="//node()[name(.)=$name and @id=$hideid]/node()"/>
		<xsl:choose>
			<!-- remove hide-whatever -->
			<xsl:when test="xalan:nodeset($hide-elements)/element[@name=$name and $id=concat('hide-', @id)]"/>
			<!-- show the content of hide-whatever in the show-whatever area -->
			<xsl:when test="xalan:nodeset($hide-elements)/element[@name=$name and $id=concat('show-', @id)]">
				<xsl:apply-templates select="$hidden"/>
			</xsl:when>
			<!-- other nodes and attributes -->
			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates select="@*|node()"/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- remove excessive whitespaces -->
	<xsl:template match="head//text()|body//text()[not(ancestor::pre) and not(ancestor::script)]|system-region//text()[not(ancestor::pre) and not(ancestor::script)]|nav//text()" priority="2">
		<xsl:text/>
		<xsl:variable name="curtext">
			<xsl:value-of select="."/>
		</xsl:variable>
		<xsl:variable name="nonewline">
			<xsl:value-of select="java:replaceAll($curtext,'(\n){2,}','')"/>
		</xsl:variable>
		<xsl:variable name="notab">
			<xsl:value-of select="java:replaceAll($nonewline,'\t','')"/>
		</xsl:variable>
		<xsl:variable name="noextraspace">
			<xsl:value-of select="java:replaceAll($notab,'(\s){2,}','')"/>
		</xsl:variable>
		<xsl:value-of select="$noextraspace"/>
	</xsl:template>
	<!-- 20181017 - drulykg - Icon node processing replaced by Velocity -->
	<!-- process the a tag and add icons -->
	<!--
	<xsl:template match="//a[ancestor::div[@id='page-content-div']][not(img) and not(div)][not(following-sibling::img)]|cascadeForcedRoot//a[not(img) and not(div)][not(following-sibling::img) and not(ancestor::div[@role='navigation']) and not(ancestor::nav)]|aside//a[not(img)][not(following-sibling::img)]"><xsl:choose><xsl:when test="//text()"><xsl:call-template name="node:process-a"><xsl:with-param name="node" select="."/></xsl:call-template></xsl:when><xsl:otherwise><a><xsl:apply-templates select="@*|node()"/></a></xsl:otherwise></xsl:choose></xsl:template>
	-->
</xsl:stylesheet>