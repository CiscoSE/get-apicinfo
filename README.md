# get-apicinfo
This script is intended to be run directly on the APIC. Recommend you copy it to the /tmp directory and run it from there.
<br/>
Pulls the installation settings from an active APIC. Specifically pulls:
<br/>
"acidiag fnvread" data<br/>
Tep Address Pool  (Output to the screen as well)<br/>
Fabric Name (Output to the screen as well)<br/>
Multicast Pool (Output to the screen as well)<br/>
Infrastructure VLAN (Output to the screen as well)<br/>
Details for each APIC <br/>
  fabricDomain<br/>
  id<br/>
  role<br/>
  fabricId<br/>
  serial<br/>
  inbMgmtAddr       (IPv4 & 6)<br/>
  inbMgmtGateway    (IPv4 & 6)<br/>
  inbMgmtAddrMask   (IPv4 & 6)<br/>
  oobMgmtAddr       (IPv4 & 6)<br/>
  oobMgmtGateway    (IPv4 & 6)<br/>
  oobMgmtAddrMask   (IPv4 & 6)<br/>
  <br/>
Output will be in a file located in the same directory. Filename format is similar to:
201905010047-FabricInfo.txt

