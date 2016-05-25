****
**** A procedure to generate Zabbix valuemap.xml files and template.xml files from MIB files for importing with standard Linux tools.
**** 
**** Author: Paul Manno
****

Linux tools required:
    smidump, xmllint, xsltproc
    
How to:
1) Run script generateXml.sh with paramters <mib_file> <snmp_version> where snmp_version can be {'v1', 'v2', 'v3'}.  The snmp_version parameter is passed in to the xsl transform to set the correct item type in the Zabbix template.
   The script will connect to an external server via HTTP to download any imported MIBs referenced in the mib you're generating the template for, and it will store those mibs in the /usr/share/snmp/mibs directory.

   Example:
      generateXml.sh XUPS-MIB.mib v2

   Result:
      Output will be XUPS-MIB-TEMPLATE.xml which you'll import into Zabbix using the web interface.  This will create all the items, graphs, and discovery items.
