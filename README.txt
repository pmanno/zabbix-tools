****
**** A procedure to generate Zabbix valuemap.xml files and template.xml files from MIB files for importing with standard Linux tools.
**** 
**** Author: Paul Manno
****

Linux tools required:
    smidump, xmllint, xsltproc
    
How to:
1 ) Convert the MIB to XML using smidump.  Here I manually discovered the preload requirements.  Will need to programatically determine this later.
         smidump --level=5 --keep-going --format xml --preload=CPQSINFO-MIB.mib --preload=CPQHOST-MIB.mib --preload=RFC1155-SMI.mib --preload=RFC1213-MIB.mib --preload=RFC-1212.mib --preload=RFC-1215.mib CPQHLTH-MIB.mib > CPQHLTH-MIB.xml

2 ) Use xslt to generate xml file formatted for Zabbix value mapping import
        xsltproc mib2valuemapping.xsl CPQHLTH-MIB.xml > CPQHLTH-MIB-VALUEMAP.xml

3 ) Use xslt to generate xml file formatted for Zabbix Template import
        xsltproc mib2template.xsl CPQHLTH-MIB.xml > CPQHLTH-MIB-TEMPLATE.xml
