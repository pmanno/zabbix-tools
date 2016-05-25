<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- zabbix value_type map: 0=numeric float, 1=character, 2=log, 3=numeric unsigned, 4=text -->
<xsl:template match="/smi">
  <xsl:variable name="ModuleName">
    <xsl:value-of select="module/@name"/>
  </xsl:variable>
  <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
  <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
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
              <xsl:copy-of select="$ModuleName"/>
            </template>
            <name>
              <xsl:copy-of select="$ModuleName"/>
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
        <type>
          <xsl:choose>
            <xsl:when test="$SNMPVERSION='v1'">1</xsl:when>
            <xsl:when test="$SNMPVERSION='v2'">4</xsl:when>
            <xsl:when test="$SNMPVERSION='v3'">6</xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
          </xsl:choose>
        </type>
        <snmp_community>{$SNMP_COMMUNITY}</snmp_community>
        <multiplier>0</multiplier>
        <!-- Append a .0 to the OID since it's required in most cases.-->
        <snmp_oid><xsl:value-of select="normalize-space(@oid)"/>.0</snmp_oid>
        <key><xsl:value-of select="normalize-space(@name)"/></key>
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
        <description><xsl:value-of select="normalize-space(description)"/></description>
        <inventory_link>0</inventory_link>
        <applications/>
        <valuemap>
          <xsl:if test="syntax/typedef/@basetype = 'Enumeration'">
            <name><xsl:value-of select="normalize-space(@name)"/></name>
          </xsl:if>
        </valuemap>
        <logtimefmt/>
      </item>
    </xsl:for-each>
  </items>
  <discovery_rules>
  <xsl:for-each select="nodes/table[@status='current'] | nodes/table[@status='mandatory']">
    <!--xsl:variable name="MACRO_NAME" select="translate(normalize-space(row/column/@name[1]), $smallcase,$uppercase)"/-->
    <xsl:variable name="MACRO_NAME" select="'SNMPVALUE'"/>
    <discovery_rule>
      <name><xsl:value-of select="normalize-space(row/column/@name[1])"/> Discovery</name>
      <type>1</type><!-- snmp -->
      <snmp_community>{$SNMP_COMMUNITY}</snmp_community>
      <snmp_oid>discovery[{#<xsl:copy-of select="$MACRO_NAME"/>},<xsl:value-of select="$ModuleName"/>::<xsl:value-of select="normalize-space(row/column/@name[1])"/>]</snmp_oid>
      <key><xsl:value-of select="normalize-space(row/column/@name[1])"/></key>
      <delay>3600</delay>
      <status>0</status>
      <allowed_hosts/>
      <snmpv3_contextname/>
      <snmpv3_securityname/>
      <snmpv3_securitylevel>0</snmpv3_securitylevel>
      <snmpv3_authprotocol>0</snmpv3_authprotocol>
      <snmpv3_authpassphrase/>
      <snmpv3_privprotocol>0</snmpv3_privprotocol>
      <snmpv3_privpassphrase/>
      <delay_flex/>
      <params/>
      <ipmi_sensor/>
      <authtype>0</authtype>
      <username/>
      <password/>
      <publickey/>
      <privatekey/>
      <port/>
      <filter>
        <evaltype>0</evaltype>
        <formula/>
        <conditions/>
      </filter>
      <lifetime>14</lifetime>
      <description/>      
      <item_prototypes>
      <xsl:for-each select="row/column[@status='current'] | row/column[@status='mandatory']">
        <xsl:if test="position()!=1">
        <item_prototype>
          <name><xsl:value-of select="normalize-space(@name)"/> on $1</name>
          <type>1</type><!-- snmp -->
          <snmp_community>{$SNMP_COMMUNITY}</snmp_community>
          <multiplier>0</multiplier>
          <snmp_oid><xsl:value-of select="$ModuleName"/>::<xsl:value-of select="normalize-space(@name)"/>.{#SNMPINDEX}</snmp_oid>
          <key><xsl:value-of select="normalize-space(@name)"/>[{#<xsl:copy-of select="$MACRO_NAME"/>}]</key>
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
          <units/>
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
          <description><xsl:value-of select="normalize-space(description)"/></description>
          <inventory_link>0</inventory_link>
          <applications/>
          <valuemap/>
          <logtimefmt/>
          <application_prototypes/>
        </item_prototype>
        </xsl:if>
      </xsl:for-each>
      </item_prototypes>
      <trigger_prototypes/>
      <graph_prototypes/>
      <host_prototypes/>
    </discovery_rule>
    </xsl:for-each>
  </discovery_rules>
        </template>
    </templates>
  <graphs>
    <xsl:for-each select="nodes/scalar[@status='current'] | nodes/scalar[@status='mandatory']">
      <xsl:variable name="basetype" select="normalize-space(syntax/typedef/@basetype)"/>
      <xsl:variable name="name" select="normalize-space(syntax/type/@name)"/>
        <xsl:if test="normalize-space($basetype) = 'Integer32' or 
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
                      $name = 'Unsigned32'">
      <graph>
        <name><xsl:value-of select="normalize-space(@name)"/></name>
        <width>900</width>
        <height>400</height>
        <yaxismin>0</yaxismin>
        <yaxismax>100</yaxismax>
        <show_work_period>0</show_work_period>
        <show_triggers>0</show_triggers>
        <type>0</type>
        <show_legend>1</show_legend>
        <show_3d>0</show_3d>
        <percent_left>0.0000</percent_left>
        <percent_right>0.0000</percent_right>
        <ymin_type_1>0</ymin_type_1>
        <ymax_type_1>0</ymax_type_1>
        <ymin_item_1>0</ymin_item_1>
        <ymax_item_1>0</ymax_item_1>
        <graph_items>
          <graph_item>
            <sortorder>0</sortorder>
            <drawtype>0</drawtype>
            <color>00BB00</color>
            <yaxisside>0</yaxisside>
            <calc_fnc>2</calc_fnc>
            <type>0</type>
            <item>
              <host><xsl:copy-of select="$ModuleName"/></host>
              <key><xsl:value-of select="normalize-space(@name)"/></key>
            </item>
          </graph_item>
        </graph_items>
      </graph>
        </xsl:if>
    </xsl:for-each>
  </graphs>
  <screens>
    <screen>
      <name>All Graphs</name>
      <hsize>1</hsize>
      <vsize><xsl:value-of select="count(nodes/scalar[@status='current'] | nodes/scalar[@status='mandatory'])"/></vsize>      
    </screen>
  </screens>
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
