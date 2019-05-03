# get-apicinfo
This script is intended to be run directly on the APIC. Recommend you copy it to the /tmp directory and run it from there.
<br/>
Pulls the installation settings from an active APIC. Specifically pulls:
<br/>
 -   "acidiag fnvread" data<br/>
 -   Tep Address Pool  (Output to the screen as well)
 -   Fabric Name (Output to the screen as well)
 -   Multicast Pool (Output to the screen as well)
 -   Infrastructure VLAN (Output to the screen as well)
 
 Details for each APIC <br/>

 -   fabricDomain
 -   id
 -   role
 -   fabricId
 -   serial
 -   inbMgmtAddr       (IPv4 & 6)
 -   inbMgmtGateway    (IPv4 & 6)
 -   inbMgmtAddrMask   (IPv4 & 6)
 -   oobMgmtAddr       (IPv4 & 6)
 -   oobMgmtGateway    (IPv4 & 6)
 -   oobMgmtAddrMask   (IPv4 & 6)
<br/>
Output will be in a file located in the same directory. Filename format is similar to:
201905010047-FabricInfo.txt

