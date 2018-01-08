import urllib2,cookielib
import json
import csv

hdr = {'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.64 Safari/537.11',
       'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
       'Accept-Charset': 'ISO-8859-1,utf-8;q=0.7,*;q=0.3',
       'Accept-Encoding': 'none',
       'Accept-Language': 'en-US,en;q=0.8',
       'Connection': 'keep-alive'}

def LoadPool(url):
	req = urllib2.Request(url, headers=hdr)

	try:
		page = urllib2.urlopen(req)
	except urllib2.HTTPError, e:
		print e.fp.read()

	content = page.read()

	jData = json.loads(content)
	return jData

Pools = {}
with open("DFL_pools.cnf", "rb") as poolfile:
	otherpools = csv.reader(poolfile, delimiter='|')
	for poolrow in otherpools:
		Pools[poolrow[0]] = LoadPool(poolrow[1])

#print Pools

def AddPoolData(wtm):
	for pool in Pools.keys():
		with open('DFL_switch.cnf', 'rb') as cnffile:
			conf = csv.reader(cnffile, delimiter=':')
			for row in conf:
				if row[0] in Pools[pool]:
					profit = float(Pools[pool][row[0]]['estimate_current'])*float(row[1])
					wtm[pool+"_"+row[0].upper()] = float(profit)
	return wtm

def AddPoolProfitData(wtm,ethPrice):
	for pool in Pools.keys():
		with open('DFL_switch.cnf', 'rb') as cnffile:
			conf = csv.reader(cnffile, delimiter=':')
			for row in conf:
				if row[0] in Pools[pool]:
						profit = "%.0f" % (100.0*float(Pools[pool][row[0]]['estimate_current'])*float(row[1])/float(ethPrice))
						wtm[pool+"_"+row[0].upper()] = float(profit)
	return wtm



