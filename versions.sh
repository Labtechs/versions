#!/bin/bash
#  Rm, Lab Version display
#  Nathan Chackerian
#  Check version of software installed for all computers in C lab (mac01..11)
#  Check versions of software installed on selected list of rooms
#  Uses color coding to indicate UPTODATE or BEHIND state
#  Fetches newest versions of software and allows for simple update with minimal commands
#  Hook up to online localhost server for an interface display of software versions
#  Add Red Green, UPTODATE, BEHIND color scheme

##  Macs ##
for i in `seq -w 01 11`
do ssh labtechs@mac$i /Users/Shared/.mac-scripts/versions.sh > /var/www/versions/mac$i/`date +%h-%d-%y`
done

## Rooms ##
Rooms=(rm301 rm323);
for i in ${Rooms[@]}
do ssh labtechs@rm$i /Users/Shared/.mac-scripts/versions.sh > /var/www/version/rm$i/`date +%h-%d-%y`
done
