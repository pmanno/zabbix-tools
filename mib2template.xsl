<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
              Template_<xsl:value-of select="module/@name"/>
            </template>
            <name>
              Template_<xsl:value-of select="module/@name"/>
            </name>
            <description></description>
            <groups>
                <group>
                    <name>Templates</name>
                </group>
            </groups>
            <applications />
  <items>
    <xsl:for-each select="nodes/scalar[@status='current']">
      <item>
        <name>
          <xsl:value-of select="@name"/>
        </name>
        <type>4</type>
        <snmp_community>{$SNMP_COMMUNITY}</snmp_community>
        <multiplier>0</multiplier>
        <snmp_oid>
          <xsl:value-of select="@oid"/>.0
        </snmp_oid>
        <key>
          <xsl:value-of select="@name"/>
        </key>
        <delay>60</delay>
        <history>7</history>
        <trends>365</trends>
        <status>0</status>
        <value_type>
          <xsl:if test="syntax/typedef/@basetype = 'Integer32'">3</xsl:if>
          <xsl:if test="syntax/typedef/@basetype = 'Counter'">3</xsl:if>
          <xsl:if test="syntax/typedef/@basetype = 'Gauge'">3</xsl:if>
          <xsl:if test="syntax/typedef/@basetype = 'Gauge32'">3</xsl:if>
          <xsl:if test="syntax/typedef/@basetype = 'OctetString'">4</xsl:if>
          <xsl:if test="syntax/typedef/@basetype = 'IpAddress'">4</xsl:if>
          <xsl:if test="syntax/typedef/@basetype = 'Enumeration'">3</xsl:if>
          <xsl:if test="syntax/typedef/@basetype = 'TruthValue'">3</xsl:if>
          <xsl:if test="syntax/typedef/@basetype = 'Unsigned32'">3</xsl:if>
          <xsl:if test="syntax/type/@name = 'Integer32'">3</xsl:if>
          <xsl:if test="syntax/type/@name = 'OctetString'">4</xsl:if>
          <xsl:if test="syntax/type/@name = 'IpAddress'">4</xsl:if>
          <xsl:if test="syntax/type/@name = 'Enumeration'">3</xsl:if>
          <xsl:if test="syntax/type/@name = 'Counter'">3</xsl:if>
          <xsl:if test="syntax/type/@name = 'Gauge'">3</xsl:if>
          <xsl:if test="syntax/type/@name = 'Gauge32'">3</xsl:if>
          <xsl:if test="syntax/type/@name = 'TruthValue'">3</xsl:if>
          <xsl:if test="syntax/type/@name = 'Unsigned32'">3</xsl:if>
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
          <xsl:value-of select="description"/>
        </description>
        <inventory_link>0</inventory_link>
        <applications/>
        <valuemap>
          <xsl:if test="syntax/typedef/@basetype = 'Enumeration'">
            <name>
              <xsl:value-of select="@name"/>
            </name>
          </xsl:if>
        </valuemap>
        <logtimefmt/>
      </item>
    </xsl:for-each>
    <xsl:for-each select="nodes/scalar[@status='mandatory']">
      <item>
        <name>
          <xsl:value-of select="@name"/>
        </name>
        <type>4</type>
        <snmp_community>{$SNMP_COMMUNITY}</snmp_community>
        <multiplier>0</multiplier>
        <snmp_oid>
          <xsl:value-of select="@oid"/>.0
        </snmp_oid>
        <key>
          <xsl:value-of select="@name"/>
        </key>
        <delay>60</delay>
        <history>7</history>
        <trends>365</trends>
        <status>0</status>
        <value_type>
          <xsl:if test="syntax/typedef/@basetype = 'Integer32'">3</xsl:if>
          <xsl:if test="syntax/typedef/@basetype = 'Counter'">3</xsl:if>
          <xsl:if test="syntax/typedef/@basetype = 'Gauge'">3</xsl:if>
          <xsl:if test="syntax/typedef/@basetype = 'Gauge32'">3</xsl:if>
          <xsl:if test="syntax/typedef/@basetype = 'OctetString'">4</xsl:if>
          <xsl:if test="syntax/typedef/@basetype = 'IpAddress'">4</xsl:if>
          <xsl:if test="syntax/typedef/@basetype = 'Enumeration'">3</xsl:if>
          <xsl:if test="syntax/typedef/@basetype = 'TruthValue'">3</xsl:if>
          <xsl:if test="syntax/typedef/@basetype = 'Unsigned32'">3</xsl:if>
          <xsl:if test="syntax/type/@name = 'Integer32'">3</xsl:if>
          <xsl:if test="syntax/type/@name = 'OctetString'">4</xsl:if>
          <xsl:if test="syntax/type/@name = 'IpAddress'">4</xsl:if>
          <xsl:if test="syntax/type/@name = 'Enumeration'">3</xsl:if>
          <xsl:if test="syntax/type/@name = 'Counter'">3</xsl:if>
          <xsl:if test="syntax/type/@name = 'Gauge'">3</xsl:if>
          <xsl:if test="syntax/type/@name = 'Gauge32'">3</xsl:if>
          <xsl:if test="syntax/type/@name = 'TruthValue'">3</xsl:if>
          <xsl:if test="syntax/type/@name = 'Unsigned32'">3</xsl:if>
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
          <xsl:value-of select="description"/>
        </description>
        <inventory_link>0</inventory_link>
        <applications/>
        <valuemap>
          <xsl:if test="syntax/typedef/@basetype = 'Enumeration'">
            <name>
              <xsl:value-of select="@name"/>
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
