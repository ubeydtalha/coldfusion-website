<?xml version="1.0" encoding="UTF-8"?>
<!-- Copyright (c) 1995-2018 Macromedia, Inc. All rights reserved. -->

<xsl:stylesheet version="1.0" 
xmlns:xsi="http://www.w3.org/1999/XMLSchema-instance" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:cf="http://www.macromedia.com/2004/cfform" 
xmlns:xf="http://www.w3.org/2002/xforms" 
xmlns:html="http://www.w3.org/1999/xhtml" 
exclude-result-prefixes="xsi cf xsl xf html">

	
	
	<!-- <cfformitem type="buttonbar" > -->
	<xsl:template match="xf:group[@appearance='buttonbar']">
		<xsl:element name="table">
			<xsl:attribute name="border">0</xsl:attribute>
			<xsl:attribute name="cellspacing">0</xsl:attribute>
			<xsl:attribute name="cellpadding">0</xsl:attribute>
			<xsl:attribute name="class">cfButtonBar</xsl:attribute>
			<xsl:attribute name="width">100%</xsl:attribute>

			<xsl:element name="tr">
				<xsl:element name="td">
					<xsl:attribute name="align">right</xsl:attribute>
					<xsl:apply-templates select="*[not(self::xf:extension)][not(self::xf:label)]"/>
				</xsl:element>
			</xsl:element>
		</xsl:element>
	</xsl:template>		
	
	
</xsl:stylesheet>
