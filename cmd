#for mds
#collectl --import lustreMDS.ph,s  --export graphite,192.168.83.30  2>&1 >/dev/null &
#for Client
collectl --import lustreClient.ph,dM  --export graphite,192.168.83.30  2>&1 >/dev/null &
#for oss
collectl --import lustreOSS.ph,s  --export graphite,192.168.83.30  2>&1 >/dev/null &



