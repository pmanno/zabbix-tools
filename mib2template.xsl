<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- zabbix value_type map: 0=numeric float, 1=character, 2=log, 3=numeric unsigned, 4=text -->
  <xsl:variable name="NumberValueTypes" select="'Integer32 Counter Gauge Gauge32 Enumeration TruthValue Unsigned32'"/>
  <xsl:variable name="StringValueTypes" select="'OctetString IpAddress'"/>
<xsl:template match="/smi">
<zabbix_export>
    <version>3.0</version>
    <date>2016-05-16T16:33:40Z</date>
    <groups>
        <group>
            <name>Templates</name>
        </group>
    </groups>
    <templates>
        <template>
            <template>
              <xsl:value-of select="module/@name"/>
            </template>
            <name>
              <xsl:value-of select="module/@name"/>
            </name>
            <description></description>
            <groups>
                <group>
                    <name>Templates</name>
                </group>
            </groups>
            <applications />
  <items>
    <xsl:for-each select="nodes/scalar[@status='current'] | nodes/scalar[@status='mandatory']">
      <item>
        <name>
          <xsl:value-of select="normalize-space(@name)"/>
        </name>
        <type>4</type>
        <snmp_community>{$SNMP_COMMUNITY}</snmp_community>
        <multiplier>0</multiplier>
        <!-- Append a .0 to the OID since it's required in most cases.-->
        <snmp_oid>
          <xsl:value-of select="normalize-space(@oid)"/>.0
        </snmp_oid>
        <key>
          <xsl:value-of select="normalize-space(@name)"/>
        </key>
        <delay>60</delay>
        <history>7</history>
        <trends>365</trends>
        <status>0</status>
        <value_type>
          <xsl:variable name="basetype" select="normalize-space(syntax/typedef/@basetype)"/>
          <xsl:variable name="name" select="normalize-space(syntax/type/@name)"/>
          <xsl:choose>
            <xsl:when test="normalize-space($basetype) = 'Integer32' or 
                      $basetype = 'Counter' or 
                      $basetype = 'Gauge' or 
                      $basetype = 'Gauge32' or 
                      $basetype = 'Enumeration' or 
                      $basetype = 'TruthValue' or 
                      $basetype = 'Unsigned32' or
                      $name = 'Integer32' or 
                      $name = 'Counter' or 
                      $name = 'Gauge' or 
                      $name = 'Gauge32' or 
                      $name = 'Enumeration' or 
                      $name = 'TruthValue' or 
                      $name = 'Unsigned32'">3</xsl:when>
            <xsl:otherwise>4</xsl:otherwise>
          </xsl:choose>
        </value_type>
        <allowed_hosts/>
        <units></units>
        <delta>0</delta>
        <snmpv3_contextname/>
        <snmpv3_securityname/>
        <snmpv3_securitylevel>0</snmpv3_securitylevel>
        <snmpv3_authprotocol>0</snmpv3_authprotocol>
        <snmpv3_authpassphrase/>
        <snmpv3_privprotocol>0</snmpv3_privprotocol>
        <snmpv3_privpassphrase/>
        <formula>1</formula>
        <delay_flex/>
        <params/>
        <ipmi_sensor/>
        <data_type>0</data_type>
        <authtype>0</authtype>
        <username/>
        <password/>
        <publickey/>
        <privatekey/>
        <port/>
        <description>
          <xsl:value-of select="normalize-space(description)"/>
        </description>
        <inventory_link>0</inventory_link>
        <applications/>
        <valuemap>
          <xsl:if test="syntax/typedef/@basetype = 'Enumeration'">
            <name>
              <xsl:value-of select="normalize-space(@name)"/>
            </name>
          </xsl:if>
        </valuemap>
        <logtimefmt/>
      </item>
    </xsl:for-each>
  </items>
        </template>
    </templates>
</zabbix_export>
  </xsl:template>
</xsl:stylesheet>
