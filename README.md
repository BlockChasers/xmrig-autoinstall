# BlockChasers.ca xmrig-autoinstall (MoneroOcean version)

This script will auto install XMRig (MoneroOcean version) as a service, start the service with logging, and enable at boot time. 

You will be able to easily configure the script to change to a different GIT_SRC_URL but be sure the required packages are matching the readme for that version of XMRig. This script can be used to auto-deploy XMRig miners very quickly.

This script was initially hacked for HiveOS as it will overwrite/uninstall XMRig when HiveOS updates. Doing all this work over and over does not sound like fun, so this will make it a one line install process. I realized afterwards that the script could be used on other machines, and made a separate/general script.

Monitor logs with `tail -f /var/log/xmrig.log`

You may keep the script in place and it can be re-run with new configuration but it will delete XMRig and re-git/compile.

You must initiate these re-compiles manually, to update the XMRig according to their update schedule.

You can also re-install or reconfigure with a different fork of XMRig (different GIT_SRC_URL)

You can mine at https://moneroocean.stream/ or try mining other coins at https://pool.blockchasers.ca/ ;)

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

The following is an example how to re-run the script to re-configure/re-compile:
```
# CHANGE TO DIR WHERE YOU INSTALLED SCRIPTS
cd /home/USER/somedir/
cd xmrig-autoinstall

nano .config

source .config

# RUN THIS TO INSTALL XMRIG (GENERAL)
./xmrig-installer.sh

# RUN THIS TO INSTALL XMRIG (HIVEOS - RUN IN HIVE SHELL)
./hiveos-xmrig-installer.sh

```

### Update Git Sources (scripts)
Probably do this weekly for now until main parts of these scripts are done. Will add auto-update script repos in future.
You must manually initiate the installation/reconfiguration scripts.
It would make no sense to auto compile XMRig as the miner is currently using the binary.
I could possibly make it copy the binary elsewhere for the service unit, then this may be possible in short future.
```
# CHANGE TO DIR WHERE YOU INSTALLED SCRIPTS
cd /home/USER/somedir/
cd xmrig-autoinstall

git pull

# I might add one more command at the bottom here in future to execute some post-update changes.
```

Yes there will be an uninstall script ... eventually :)

**Plz buy me coffee?**

**BTC:** bc1q859l5w74l276y96h30rv3sl7p3tvalrxsfa5h3<br />
**LTC:** LLtgfUUNh6LKKSuUbZJe2CFuVwjG8ES9zt<br />
**DOGE:** DS7an4H1FxPRPbN5LrUhQ7VzuGiHC5unaZ<br />
**ETH/ERC-20:** 0x14Cc36Dd9078A0E1Bd8026f735580fe548BAb709<br />
**BNB/BEP-20:** bnb1h573j7yx4k45kz7u8psws3g4tacr34g8rwmvm8<br />
**TRX/TRC-20:** TWHEVqjALbMG7RQxJLc4oWrNzqwviN8UX5<br />
**XMR:** 43aRmqLF6kaGqwh3qGxMgpYaWBxAXxFAnZabCouZyRrR1gLyi29YCUxdCTtRJjiBKB2sBUkRjynUA9D2fRFL7tiE7iyftmY<br />

### ~ BlockChasers.ca

EOF
