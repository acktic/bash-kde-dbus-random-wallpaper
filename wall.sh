#!/bin/bash
# KDE DBus random wallpaper from directory
wp_path=/home/acktic/Pictures/ 
image=$(ls $wp_path | grep -E '(jpg|png)$' | sort -R | tail -1)
if [ -e '/home/acktic/Pictures/Wallpaper/wallpaper1.jpg' ]
then
rm '/home/acktic/Pictures/Wallpaper/wallpaper1.jpg'
cp $wp_path$image '/home/acktic/Pictures/Wallpaper/wallpaper2.jpg'
dbus-send --session --dest=org.kde.plasmashell --type=method_call /PlasmaShell org.kde.PlasmaShell.evaluateScript 'string:
var Desktops = desktops();                                                                                                                       
for (i=0;i<Desktops.length;i++) {
        d = Desktops[i];
        d.wallpaperPlugin = "org.kde.image";
        d.currentConfigGroup = Array("Wallpaper",
                                    "org.kde.image",
                                    "General");
        d.writeConfig("Image", "file:///home/acktic/Pictures/Wallpaper/wallpaper2.jpg");
}'
else
rm '/home/acktic/Pictures/Wallpaper/wallpaper2.jpg'
cp $wp_path$image '/home/acktic/Pictures/Wallpaper/wallpaper1.jpg'
dbus-send --session --dest=org.kde.plasmashell --type=method_call /PlasmaShell org.kde.PlasmaShell.evaluateScript 'string:
var Desktops = desktops();                                                                                                                       
for (i=0;i<Desktops.length;i++) {
        d = Desktops[i];
        d.wallpaperPlugin = "org.kde.image";
        d.currentConfigGroup = Array("Wallpaper",
                                    "org.kde.image",
                                    "General");
        d.writeConfig("Image", "file:///home/acktic/Pictures/Wallpaper/wallpaper1.jpg");
}'
fi
