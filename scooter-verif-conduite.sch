<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:foo="http://cogip.biz/">
    
    <xsl:include href="scooter-is-allowed.xsl" />
    
    <sch:ns uri="http://cogip.biz/" prefix="foo"/>
    
    <sch:pattern >
        <sch:rule context="client">
            <sch:assert test="foo:conduiteAutorisée(.)">
                Le client <sch:value-of select="concat(nom,' ',prenom)"/>
                n'est pas autorisé à conduire !!
            </sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>