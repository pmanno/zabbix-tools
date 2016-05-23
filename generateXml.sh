#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "calling dos2unix on $1"
dos2unix $1
declare -a MIBS
declare -a WGETRESULTS
SERVER_URL="http://www.circitor.fr/Mibs/Files"

echo "Determining MIB imports"
INDEX=0

#
# parse the IMPORTS section of the MIB to find what MIBs are prerequisites.
#
for i in `sed -n '/IMPORTS/,/;/p' $1 | grep "FROM" | sed 's/;//' | awk '{ print $3 }' | sort -u`
do
   MIBS[$INDEX]=$i
   INDEX=$(($INDEX + 1))
done

#
# try to download the required mibs from the SERVER_URL specified above
#
INDEX=0
for m in "${MIBS[@]}"
do
   echo "Getting first mib via $SERVER_URL/$m.mib"
   wget -q $SERVER_URL/$m.mib
   if [ $? -gt 0 ]
   then
      echo "Server error getting MIB file: $m.mib"
      wget -qS $SERVER_URL/$m.mib
      exit 1
   fi
done

#
# all mibs downloaded, now we can perform steps to generate xml.
#

PRELOAD_STRING=""

for m in "${MIBS[@]}"
do
   PRELOAD_STRING="$PRELOAD_STRING --preload=$m.mib"
done

FILENAME=$(basename "$1")
XMLFILE="${FILENAME%.*}".xml
smidump --level=5 --keep-going --format xml $PRELOAD_STRING $1 > $XMLFILE

if [ $? -gt 0 ]
then
   echo "Problem executing smidump... exiting"
   exit 2
fi

VALUEMAPXMLFILE="${FILENAME%.*}"-VALUEMAP.xml
TEMPLATEXMLFILE="${FILENAME%.*}"-TEMPLATE.xml

echo "Generating value-map xml file $VALUEMAPXMLFILE"
xsltproc $DIR/mib2valuemapping.xsl $XMLFILE > $VALUEMAPXMLFILE

if [ $? -gt 0 ]
then
   echo "Problem generating value map xml file... exiting"
   exit 3
fi

echo "Generating template xml file $TEMPLATEXMLFILE"
xsltproc $DIR/mib2template.xsl $XMLFILE > $TEMPLATEXMLFILE

if [ $? -gt 0 ]
then
   echo "Problem generating tempate xml file... exiting"
   exit 4
fi
   
exit 0
