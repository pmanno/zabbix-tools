<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<zabbix_export>
    <version>3.0</version>
    <date>2016-05-16T16:33:40Z</date>
    <value_maps>
<xsl:for-each select=".//scalar[syntax/typedef/@basetype='Enumeration']">
        <value_map>
            <name><xsl:value-of select="@name"/></name>
            <mappings>
            <xsl:for-each select="syntax/typedef/namednumber">
               <mapping>
                  <value><xsl:value-of select="@name"/></value>
                  <newvalue><xsl:value-of select="@number"/></newvalue>
               </mapping>
            </xsl:for-each>
            </mappings>
        </value_map>
</xsl:for-each>
    </value_maps>
</zabbix_export>
</xsl:template>
</xsl:stylesheet>
        

