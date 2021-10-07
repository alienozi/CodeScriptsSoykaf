#!/bin/bash

##############################################################################
#   1	THIS FILE IS ARMED, ONCE IN REAL MODE IT *WILL* DELETE FILES!	#
#   2	AUTHOR: OGUZ ALP 'ALIENOZI' DURAN 					#
#   3	DATE: 7.11.2021 @ 05:42 AM 	COMPABILITY:	BASH- NON POSIX!	#
#   4	PURPOSE: 								#
#   5	IF YOU ARE READING THIS, EITHER I AM DEAD OR YOU ARE INSPECTING MY	#
#   6	SOURCE CODE. IF THE FORMER IS TRUE, I AM TERIBLY SORRY TO HEAR THAT.	#
#   7 	I CAN CERTAINLY ONLY HOPE THAT I DID GOOD AND THAT I WILL BE REMEM-	#
#   8	BERED AS A GOOD FRIEND, AS A GOOD PARTNER AND AS A GOOD SCIENTIST.	#
#   9	WITH LOVE,							-OZI	#
##############################################################################


#colors for output colors XD https://en.wikipedia.org/wiki/ANSI_escape_code
RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m'

# 1. Define UUID (lsblk/blkid)
# 2. Get device File (findfs)
# 3. Generate a Pseudo-mount directory and mount drive (bullshit)
# 4. Affected Directories
#***********************ex1*********************************
SEGATE_UUID="UUID GOES HERE"
SEGATE=$(findfs UUID=$SEGATE_UUID)
SEGATE_MNT=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; echo '')
SEGATE_DIRS=( 	"/mnt/$SEGATE_MNT/path"
	    )
#**********************ex2*******************************
SONY_UUID="UUID GOES HERE"
SONY=$(findfs UUID=$SONY_UUID)
SONY_MNT=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; echo '')
SONY_DIRS=( 	"/mnt/$SONY_MNT/path"

	  )
#*********************************************************************
function unmountbefore
{	
	UMOUNTLIST=( 	$SEGATE
			$SONY
		   )
	for umount in "${UMOUNTLIST[@]}" ; do
	if  findfs UUID=$umount > /dev/null 2>&1 ; then
		umount $umount
		echo "Unmounted $umount"
	fi
	done
}		
function mount_targets
{
	mkdir /mnt/$SEGATE_MNT
	mount -U $SEGATE_UUID /mnt/$SEGATE_MNT
	echo "Segate is in $SEGATE with UUID $SEGATE_UUID and mounted as /mnt/$SEGATE_MNT"
	
	mkdir /mnt/$SONY_MNT
	mount -U $SONY_UUID /mnt/$SONY_MNT
	echo "Sony is in $SONY with UUID $SONY_UUID and mounted as /mnt/$SONY_MNT"
}

function checkdirs
{
	for dirs in "${SEGATE_DIRS[@]}" ; do
    	if [ -d "$dirs" ] 
    		then  printf "${GREEN}File:${NC} $dirs exists\n"
		else  printf "${RED}Error:${NC} file $dirs does not exist\n"
	fi
	done
	
	for dirs in "${SONY_DIRS[@]}" ; do
    	if [ -d "$dirs" ] 
    		then  printf "${GREEN}File:${NC} $dirs exists\n"
		else  printf "${RED}Error:${NC} file $dirs does not exist\n"
	fi
	done
}

function deletedirs
{
	printf "${RED} LAST CONFIRMATION! DO YOU REALLY WANT TO DELETE ALL THIS? ${NC}"
	read -p "Confirm, DELETE? Y/N: " DELCONF
	case $DELCONF in
        	[Yy]* ) printf "${GREEN}Okay, brother, thank you for doing your duty. I really appreciate it. See you on the flipside!${NC}";;
        	[Nn]* ) exit;;
       	 * ) echo "Please answer yes or no next time."; exit;;
    	esac
    		
	for dir in "${SEGATE_DIRS[@]}" ; do
    	echo "File: $dir deleted"
    	rm -rf "$dir"
	done
	
	for dir in "${SONY_DIRS[@]}" ; do
    	echo "File: $dir deleted"
    	rm -rf "$dir"
	done
}
function test_mode
{
	unmountbefore
	mount_targets
	checkdirs

}

function doomsday_mode
{
	unmountbefore
	mount_targets
	checkdirs
	deletedirs
}

clear
echo "*****************************************************************************************"
echo "*Alienozi's Doomsday Delete Utility for Bros with Access to My Death Will Version 1.0	*"
printf  "*			Or shortly: \033[0;31mA\033[0;33mD\033[1;33mD\033[0;32mU\033[1;34mB\033[0;34mA\033[0;35mM\033[1;30mD\033[1;37mW\033[0m Ver 1.0					*\n"
echo "*****************************************************************************************"
echo "Please Run the script in TEST MODE first!"
#Test or real version with password!
echo "If this is a test, press ENTER/RETURN."
echo "If this is the real deal, well, type \"IamSorryThatYouDiedBroRIP\""
read -p "Input Now: " DANGER_INPUT
if [ "$DANGER_INPUT" == "" ]; then 
    echo 'You pressed enter! Entering (!) Test Mode'
    test_mode
fi
if [ "$DANGER_INPUT" == "IamSorryThatYouDiedBroRIP" ]
then
	read -p "Entering Danger Zone! Confirm Y/N: " DANGER_INPUT_2
	    	case $DANGER_INPUT_2 in
        		[Yy]* ) echo "Confirmed in the Danger Zone! There is no return from here!"; 
				doomsday_mode;;
        		[Nn]* ) exit;;
       		 * ) echo "Please answer yes or no next time."; exit;;
    		esac
fi

#cleanup and unmount all mounted drives
sleep 5
UMOUNTLIST=( 	$SEGATE
		$SONY
	   )
		   
for umount in "${UMOUNTLIST[@]}" ; do
	umount $umount
	echo "Unmounted $umount"
done

MNTLIST=(	$SEGATE_MNT
		$SONY_MNT	
	)
#remove pseudo-generated mountpoints
	
for mnt in "${MNTLIST[@]}" ; do
	[ -d "/mnt/$mnt" ] && rm -d /mnt/$mnt
done
