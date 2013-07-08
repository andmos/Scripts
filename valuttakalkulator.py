#!/usr/bin/python 

import sys
import urllib2
from decimal import Decimal
from xml.dom.minidom import parseString

# Importing current currency from DnB.no and takes inn your price in NOK.
# Returns total. 

price = input("Cost in USD: ")
file = urllib2.urlopen('https://www.dnb.no/portalfront/datafiles/miscellaneous/csv/kursliste_ws.xml')
data = file.read()
file.close()
dom = parseString(data)
xmlTag = dom.getElementsByTagName('salg')[0].toxml()
xmlData=xmlTag.replace('<salg>','').replace('</salg>','')
total = (Decimal(price) * Decimal(xmlData))
print str(total) + " nok";   
