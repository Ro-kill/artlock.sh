# artlock.sh
Used to replace blurlock. Builds a lock screen image by taking a screen shot, and selecting a random png from a lockScreens directory, and crops the png over the screenshot. Then the screen is locked using this image.

## Overview

This code is based off of blur lock, and uses display magic to combine a png with a screenschot of the background. Then the screen is locked with this image. I use Manjaro i3, and thus the lock I use is called i3lock. Switch this to what ever lock you use on your system. If there are two monitors, it builds a new png with two different ones, that way the lock screen covers both monitors. I have it so that the png is built, one over the other, but if you prefer your monitors side by side, you should switch this so it builds the new png, one next to the other.

You require a directory called lockScreens in your home directory with all the different pngs you wish to use. I recomend building your own pngs with GIMP.
