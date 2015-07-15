# A modified collectl (Based on version 3.7.3) #

I made following modifications, mainly on the Lustre part and the Graphite part:

- 1. Merged [lustre plugins](https://github.com/pcpiela/collectl-lustre) devevelped by Peter Piela.
- 2. changed INSTALL and UNINSTALL script, to install the plugin automatically
- 3. changed graphite.pl on line 120, change `hostname` with `hostname -s` to get avoid the anonying domainname as surfix in graphite metric output.
- 4. add a cmd file which shows how to start collectl as a data feeder of graphite, and how to use the lustre plugin 
- 5. If you want to use the lustre plugin, **do not** give any lustre related parameter to collectl, just use:`collectl --import lustreXXX.ph,[s|d|other] --export graphite,ip[d=1] [-d13468] [-d 16384]`, d=1 means debug mode of graphite, `-d 16384` means debug mode of the plugin. "s" after `.ph` means summray mode, "d" after `.ph` means detailed mode. Read the plugin code for more details.  
- 6. The XXXPrintExport() function in `lustreClient.ph`, `lustreMDS.ph`, `lustreOSS.ph` controls which Lustre metrics will be send to graphite, I changed code in `lustreOSS.ph` to output statistic by OST and some detailed service metric in the summary mode. 

Here is detail of cmd file:

	#for mds: 
	collectl --import lustreMDS.ph,s  --export graphite,192.168.83.30  2>&1 >/dev/null & 
	#Client: 
	collectl --import lustreClient.ph,dM  --export graphite,192.168.83.30  2>&1 >/dev/null & 
	#for oss: 
	collectl --import lustreOSS.ph,s  --export graphite,192.168.83.30  2>&1 >/dev/null &
