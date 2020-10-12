#!/bin/bash

#################### Verify Input Parameters ########################
E_WRONG_ARGS=85
script_parameters="-a -h -m -z"
Number_of_expected_args=1
	if [ $# -ne $Number_of_expected_args ]
	then
		echo "Usage: `basename $0` $script_parameters"
		exit $E_WRONG_ARGS
	fi

#################### Exit if it is root id #########################

ROOT_UID=0 #Only users with $UID 0 have root privileges.
E_ROOT=87 #Non-root exit error.
user_id=`echo $UID`

# Dont Run as root, of course.
if [ "$user_id" -eq "$ROOT_UID" ]
then
	echo "Must not be root to run this script."
	exit $E_ROOT
fi

#################### Check if PWD is the one we passed #########################
LOG_DIR=""
E_XCD=86 #Can't change directory

cd $LOG_DIR
if [ "$PWD" != "$LOG_DIR" ] # Not in required path
then
	echo "Can't change to $LOG_DIR."
	exit $E_XCD
fi


