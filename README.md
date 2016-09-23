*23.09.16 If you have problems with updating my overlay, simply remove and add it again.*

layman -d rinaldus-overlay

layman -a rinaldus-overlay

*This is my personal overlay. I often do experiments in it. You may use it without any warranties, on your own risk!*

# Install

## Automatic

My overlay is now part of layman's database. Simply type following command to add it:
layman -a rinaldus-overlay

## Manual

layman -f -o https://raw.github.com/rinaldus/rinaldus-overlay/master/rinaldus-overlay.xml -a rinaldus-overlay

Add url below to your /etc/layman/layman.cfg (in overlays section) to prevent annoying warnings:
https://github.com/rinaldus/rinaldus-overlay/raw/master/repositories.xml
