<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:foo="http://cogip.biz/"
    exclude-result-prefixes="xs"
    version="3.0">
    
    <xsl:function name="foo:conduiteAutorisée" as="xs:boolean">
        <xsl:param name="client" as="element(client)" />
        <xsl:choose>
            <xsl:when test="exists($client/permis-declares/permis)">
                <xsl:sequence select="true()" />
            </xsl:when>
            <xsl:when test="$client/date-naissance lt '1988-01-01'">
                <xsl:sequence select="true()" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="false()" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
</xsl:stylesheet>