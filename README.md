# get-apicinfo
This script is intended to be run directly on the APIC. Recommend you copy it to the /tmp directory and run it from there.

Pulls the installation settings from an active APIC. Specifically pulls:

"acidiag fnvread" data
Tep Address Pool
Fabric Name
Multicast Pool
APIC Info

Output will be in a file located in the same directory. Filename format is similar to:
201806010047-FabricInfo.txt
