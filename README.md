install
```shell script
pip3 install xlib
git pull origin master && make install
```


### Raspberry setup
```shell
sudo apt update && sudo apt upgrade && sudo apt install vlc mc
mkdir /home/pi/.config/autostart
```
#### Autostart
```shell
nano /home/pi/.config/autostart/vlc.desktop
```
```shell
[Desktop Entry]
Type=Application
Exec=qbittorrent
```

```shell
nano /home/pi/.config/autostart/qbittorrent.desktop
```
```shell
[Desktop Entry]
Type=Application
Exec=qbittorrent
```

##### USB automount
```shell
sudo apt install ntfs-3g pmount
sudo nano /etc/udev/rules.d/usbstick.rules
```
```shell
ACTION=="add", KERNEL=="sd[a-z][0-9]", TAG+="systemd", ENV{SYSTEMD_WANTS}="usbstick-handler@%k"
```

create new servis
```shell
sudo nano /lib/systemd/system/usbstick-handler@.service
```
```shell
[Unit]
Description=Mount USB sticks
BindsTo=dev-%i.device
After=dev-%i.device

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/local/bin/cpmount /dev/%I
ExecStop=/usr/bin/pumount /dev/%I
```

Create mount file
```shell
sudo nano /usr/local/bin/cpmount
```
```shell
#!/bin/bash
if mountpoint -q /media/usb1
then
   if mountpoint -q /media/usb2
   then
      if mountpoint -q /media/usb3
      then
         if mountpoint -q /media/usb4
         then
             echo "No mountpoints available!"
             #You can add more if you need
         else
             /usr/bin/pmount --umask 000 --noatime -w --sync $1 usb4
         fi
      else
         /usr/bin/pmount --umask 000 --noatime -w --sync $1 usb3
      fi
   else
      /usr/bin/pmount --umask 000 --noatime -w --sync $1 usb2
   fi
else
   /usr/bin/pmount --umask 000 --noatime -w --sync $1 usb1
fi
```

make executable 
```shell
sudo chmod u+x /usr/local/bin/cpmount && sudo reboot now
```