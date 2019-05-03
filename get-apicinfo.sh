#  Copyright (c) {2019} Cisco and/or its affiliates.
#
#  This software is licensed to you under the terms of the Cisco Sample
#  Code License, Version 1.0 (the "License"). You may obtain a copy of the
#  License at
#
#               https://developer.cisco.com/docs/licenses
#
#  All use of the material herein must be in accordance with the terms of
#  the License. All rights not expressly granted by the License are
#  reserved. Unless required by applicable law or agreed to separately in
#  writing, software distributed under the License is distributed on an "AS
#  IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
#  or implied.


#  Set File Name for exported data
fileName=$(date +"%Y%m%d%H%M")-FabricInfo.txt
#  using acidiag to get the names, IP addresses and POD number for each switch.    
acidiag fnvread > ./$fileName
echo "############ Fabric Settings ###########" | tee -a ./$fileName
#  using acidiag to get the TEP Address pool and fabric domain name    
avData=`acidiag avread`
echo "tepAddressPool:  $(echo $avData | egrep -o 'TEP ADDRESS=.+' | cut -d ' ' -f 2 | cut -d '=' -f 2)" | tee -a ./$fileName
echo "fabricName:      $(echo $avData | egrep -o "FABRIC_DOMAIN name=.+" | cut -d " " -f 2 | cut -d "=" -f 2)" | tee -a ./$fileName
#  Using moquery to pull information about the multicast pool
mcastPool="$(moquery -c fvBD | grep -E 'name|bcastP|dn' | grep -B 2 'infra' | grep 'bcastP' -m 1 | cut -d ':' -f 2)"
echo "Muticast Pool:   $(ipcalc --network $mcastPool$'/15' | cut -d '=' -f 2)" | tee -a ./$fileName
# Using ifconfig to find the infrastructure VLAN. We have to assume it is in a high range.
echo "Infra VLAN:      $(ifconfig |  egrep -oe 'bond0\.[0-9]{4}' | sed -e 's?bond0\.??')" | tee -a ./$fileName

#echo "############ APIC Controller Info  ###########" >> ./$fileName
#acidiag avread | grep "id=.*" | cut -d ' ' -f 9,10,17,18,20,35,37,39 >> ./$fileName
#moquery -c fabricNode -f 'fabric.Node.role=="controller"'| egrep -e "fabric.Node|^id|name |model|role|vendor|version" >> ./$fileName

echo "############ APIC Controller Info ###########" >> ./$fileName
moquery -c topSystem -f 'top.System.role=="controller"' | egrep -e "top.System|id|role|fabricDomain|fabricId|role|serial|inbMgmtAddr|inbMgmtGateway|inbMgmtAddrMask|oobMgmtAddr|oobMgmtGateway|oobMgmtAddrMask" | \
	sed -e "s?top.System?########## Controller ###############?" >> ./$fileName
