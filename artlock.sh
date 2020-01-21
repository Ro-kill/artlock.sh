#!/bin/bash

# Change lock used in /usr/bin/i3exit to use this

# ~/bin/artlock.sh

# Take screenshot
import -window root ~/lockScreens/tmp/screenshot.png

# If parameters
if test -f ~/lockScreens/$1; then
   echo "exists"

   # Makes LockScreen
   convert ~/lockScreens/tmp/screenshot.png ~/lockScreens/$1 -composite ~/lockScreens/tmp/lockScreen.png

   # Locks screen
   i3lock -i ~/lockScreens/tmp/lockScreen.png

   exit 0
else
   echo "no/invalid paramater"   
fi

# Selects random lockImage
lockScreen="$(ls ~/lockScreens |grep .png |sort -R |tail -1)"
echo $lockScreen

# Num of monitors
count=$(xrandr |grep " connected" |wc -l)

# If two monitors
if [ $count -eq 2 ]
then
   echo "two monitors"
   lockScreen2="$(ls ~/lockScreens |grep .png |grep -v $lockScreen |tail -1)"
   convert ~/lockScreens/$lockScreen ~/lockScreens/$lockScreen2 -append ~/lockScreens/tmp/dualImage.png
   lockScreen="tmp/dualImage.png"
   echo $lockScreen
fi

# Makes lockScreen
convert ~/lockScreens/tmp/screenshot.png ~/lockScreens/$lockScreen -composite ~/lockScreens/tmp/lockScreen.png

# Locks screen
i3lock -i ~/lockScreens/tmp/lockScreen.png

# sleep 1 adds a small delay to prevent possible race conditions with suspend
sleep 1

exit 0
