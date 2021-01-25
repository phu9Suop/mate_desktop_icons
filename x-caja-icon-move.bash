#!/bin/bash
# $0 moves Icons to the other screen
# It takes several seconds, until the app is loaded and the window can be identified

#set -e
# . /usr/local/bin/log_functions.func

open_log

[ "${UID}" = 0 ] && echo "Do not operate $0 as root" &&  closelog && exit 1

cd ~
WINDOW_SHORT=x-caja-desktop

until xwininfo -tree -root | grep ${WINDOW_SHORT} ; do
	echo xwininfo $?
	/bin/sleep 5
done  > /dev/null 2>&1

wmctrl -r ${WINDOW_SHORT} -b remove,maximize_vert,maximize_horz
wmctrl -r ${WINDOW_SHORT} -e 400,1440,30,1024,770
#wmctrl -r ${WINDOW_SHORT} -b add,maximize_vert,maximize_horz

#close_log_exit

exit 0
