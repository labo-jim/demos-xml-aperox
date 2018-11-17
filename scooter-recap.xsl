<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:foo="http://cogip.biz/"
    exclude-result-prefixes="xs"
    version="3.0">
    
    <xsl:import href="scooter-is-allowed.xsl"/>
    
    <xsl:output method="html"></xsl:output>
    
    <xsl:variable name="locations" select="doc('scooter-locations.xml')"/>
    <xsl:variable name="pattern-dates" select="'[F] [D] [MNn] [Y] à [H]:[m]'"/>
    
    <xsl:template match="client">
        <div class="client">
            <h2>
                <xsl:value-of select="concat(prenom,' ',upper-case(nom))"/>
            </h2>
            
            <xsl:choose>
                <xsl:when test="foo:conduiteAutorisée(.)">
                    <p class="ok">Autorisé à conduire</p>
                </xsl:when>
                <xsl:otherwise>
                    <p class="ko">N'est pas autorisé à conduire !!</p>
                </xsl:otherwise>
            </xsl:choose>
            
            <h3>Récapitulatif des locations</h3>         
            <ul>
                <xsl:apply-templates select="$locations/locations/location[@client = current()/@id]" /> 
            </ul>
        </div>  
    </xsl:template>
    
    <xsl:template match="location">
       <li>        
           Du <xsl:value-of select="format-dateTime(@debut,$pattern-dates)"/>
           au <xsl:value-of select="format-dateTime(@fin,$pattern-dates)"/>
       </li>
    </xsl:template>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Récapitulatif des locations</title>
                <style>
                    /* Reduire cet élément pendant la présentation */
                    body {
                        font-family: sans-serif;
                        color: navy;
                    }
                    h1, h2, h3 { color: #287996 }
                    .client {
                        border: 1px solid navy;
                        margin: 20px;
                        padding: 15px;
                        box-shadow: 5px 10px 15px rgba(0,0,0,0.2);
                    }
                    .ok { color: #092; font-weigh: bold; }
                    .ko { color: #900; font-weigh: bold; }
                </style>
            </head>
            <body>
                <img src="logo.png" height="150px"></img>
                <h1>Récapitulatif des locations</h1>
                
                
                <xsl:apply-templates />
            </body>
        </html>
    </xsl:template>
    
  
    
</xsl:stylesheet>