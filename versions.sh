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
# readlist='.list-classrooms.txt'
# while read -r line
# do
#	name=$line
#	echo $name
# done < "$filename"
Rooms=(202 301 302 305 306 307 309 311 313 402 409 410 411 412 413 501 503 504 505 507 509 510 511 512 513);
for i in `seq 0 25`
# Login as NYCDOE
do
	ROOM=`echo ${Rooms[$i]}`
	echo $ROOM
	ssh labtechs@rm$ROOM /Users/Shared/.mac-scripts/versions.sh > /var/www/version/$ROOM/`date +%h-%d-%y` 
done
