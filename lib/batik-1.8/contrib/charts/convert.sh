#!/bin/sh
# -----------------------------------------------------------------------------
#
#   Licensed to the Apache Software Foundation (ASF) under one or more
#   contributor license agreements.  See the NOTICE file distributed with
#   this work for additional information regarding copyright ownership.
#   The ASF licenses this file to You under the Apache License, Version 2.0
#   (the "License"); you may not use this file except in compliance with
#   the License.  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
# $Id: convert.sh 475477 2006-11-15 22:44:28Z cam $
# ----------------------------------------------------------------------------

if [ "$1" = "" ] ; then
  echo
  echo "Usage  : ./convert.sh xml-filename xslt-stylesheet"
  echo
  echo "Example: ./convert.sh data bar"
  echo "    Will convert file xml/data.xml with stylesheet xsl/bar.xsl into out/data-bar.svg"
  exit 1
fi

if [ "$JAVA_HOME" = "" ] ; then
  echo "ERROR: JAVA_HOME not found in your environment."
  echo
  echo "Please, set the JAVA_HOME variable in your environment to match the"
  echo "location of the Java Virtual Machine you want to use."
  exit 1
fi

LOCALCLASSPATH=.
for i in ../../lib/build/xalan*.jar ; do
  LOCALCLASSPATH=${LOCALCLASSPATH}:$i
done
for i in ../../lib/build/xerces*.jar ; do
  LOCALCLASSPATH=${LOCALCLASSPATH}:$i
done

echo "Using classpath: $LOCALCLASSPATH"

echo "$JAVA_HOME/bin/java -classpath $LOCALCLASSPATH -Djavax.xml.transform.TransformerFactory=org.apache.xalan.processor.TransformerFactoryImpl -Djavax.xml.parsers.DocumentBuilderFactory=org.apache.xerces.jaxp.DocumentBuilderFactoryImpl -Djavax.xml.parsers.SAXParserFactory=org.apache.xerces.jaxp.SAXParserFactoryImpl org.apache.xalan.xslt.Process -IN xml/$1.xml -XSL xsl/$2.xsl -OUT out/$1-$2.svg -EDUMP"
$JAVA_HOME/bin/java -classpath $LOCALCLASSPATH -Djavax.xml.transform.TransformerFactory=org.apache.xalan.processor.TransformerFactoryImpl -Djavax.xml.parsers.DocumentBuilderFactory=org.apache.xerces.jaxp.DocumentBuilderFactoryImpl -Djavax.xml.parsers.SAXParserFactory=org.apache.xerces.jaxp.SAXParserFactoryImpl org.apache.xalan.xslt.Process -IN xml/$1.xml -XSL xsl/$2.xsl -OUT out/$1-$2.svg -EDUMP

echo
echo "have a nice day ;-)"
