<?xml version="1.0" encoding="UTF-8"?>
<!-- Copyright (c) 1995-2018 Macromedia, Inc. All rights reserved. -->

<xsl:stylesheet version="1.0"
xmlns:xsi="http://www.w3.org/1999/XMLSchema-instance" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:cf="http://www.macromedia.com/2004/cfform" 
xmlns:xf="http://www.w3.org/2002/xforms" 
xmlns:html="http://www.w3.org/1999/xhtml" 
exclude-result-prefixes="xsi cf xsl xf html">
 

	<xsl:template match="cf:grid[@format='XML']">
		<xsl:element name="table">
			<xsl:attribute name="border">1</xsl:attribute>
			<xsl:attribute name="cellpadding">2</xsl:attribute>
			<xsl:attribute name="cellspacing">0</xsl:attribute>
			<xsl:attribute name="width">100%</xsl:attribute>
			<xsl:attribute name="class">cfGrid</xsl:attribute>

			
			<xsl:for-each select="columns">
				<xsl:element name="tr">
					<xsl:for-each select="column">
						<xsl:element name="td">
							<xsl:attribute name="width"><xsl:value-of select="./@width"/></xsl:attribute>
							<xsl:attribute name="class">cfGridHeader</xsl:attribute>
							<xsl:attribute name="nowrap">nowrap</xsl:attribute>
							<xsl:value-of select="./@header"/>
						</xsl:element>
					</xsl:for-each>			
				</xsl:element>
			</xsl:for-each>
			
			<xsl:for-each select="rows">
				<xsl:for-each select="row">
					<xsl:element name="tr">		
						<xsl:attribute name="class">cfGridRow</xsl:attribute>							
						<xsl:for-each select="./*">
							<xsl:element name="td">
								<xsl:attribute name="class">cfGridCell</xsl:attribute>
								<xsl:attribute name="valign">top</xsl:attribute>
								<xsl:value-of select="./text()" disable-output-escaping="yes"/>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:element>	
	</xsl:template>
	
</xsl:stylesheet>
