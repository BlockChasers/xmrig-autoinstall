# xmrig-installer

This script will auto install XMRig (MoneroOcean version) as a service, start the service with logging, and enable at boot time. 

You will be able to easily modify the script to change to a different GIT_SRC_URL but be sure the required packages are matching the readme for that version of XMRig. This script can be used to auto-deploy XMRig miners very quickly.

This script was initially hacked for HiveOS as it will overwrite/uninstall XMRig when HiveOS updates. Doing all this work over and over does not sound like fun, so this will make it a one line install process. I realized afterwards that the script could be used on other machines, and made a separate/general script.

Monitor logs with `tail -f /var/log/xmrig.log`

Script can be re-run with new parameters but it will delete XMRig and re-git/compile.

### Features
- Auto-Build XMRig (MoneroOcean version)
- Auto-Create XMRig Service
- Start XMRig service on boot
- Start NTP & Logrotate on boot
- Update configuration script

## General Instructions
Just copy the commands either on your regular linux machine (Debian, Ubuntu) or on a HiveOS Rig - you just have to open Hive Shell, right click, paste in browser, and paste each line one at a time and press OK.

The configuration may or may not be made interactive in the future.

### Auto Install XMRig
```
# IF YOU DONT HAVE GIT OR ARE UNSURE
sudo apt update ; sudo apt install -y git

# CHANGE TO DIR WHERE YOU WANT INSTALLER/SCRIPTS
cd /home/USER/somedir/

# GIT THE REPO
git clone https://github.com/BlockChasers/xmrig-autoinstall.git
cd xmrig-autoinstall

# EDIT CONFIG FILE & KEEP IN SAME DIR AS INSTALL SCRIPT
nano .config

# JUST RUN THESE
source .config
chmod +x *.sh

# RUN THIS TO INSTALL XMRIG (GENERAL)
./xmrig-installer.sh

# RUN THIS TO INSTALL XMRIG (HIVEOS - RUN IN HIVE SHELL)
./hiveos-xmrig-installer.sh

```

EOF
