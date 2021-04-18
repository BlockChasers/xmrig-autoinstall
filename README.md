# xmrig-installer

This script will auto install XMRig as a service, start the service with logging, and enable at boot time.

This script was initially hacked for HiveOS as it will overwrite/uninstall XMRig when HiveOS updates. 
Doing all this work over and over does not sound like fun, so this will make it a one line install process.

Monitor logs with `tail -f /var/log/xmrig.log`

Script can be re-run with new parameters but it will delete XMRig and re-git/compile.

### Features
- Auto-Build XMRig (MoneroOcean version)
- Auto-Create XMRig Service
- Start XMRig service on boot
- Start NTP & Logrotate on boot
- Update configuration script

## General Instructions
Just paste the export lines one at a time and edit them to set miner settings.
If you make a mistake, no need to start from step one, just repaste, and re-edit the line and hit enter again.
This may or may not be made interactive in the future.

### Auto Install XMRig
```
# USE --coin <coin> OR CHANGE TO --algo <algo>
export POOL_COIN="--coin monero"

# Enable TLS by removing '#' - Disable TLS by prepending '#' or skipping
#export POOL_TLS="--tls"

export POOL_HOST=gulf.moneroocean.stream
export POOL_PORT=10001
export POOL_USER=MY_MONERO_ADDRESS
export POOL_PASS=MY_POOL_PASS

# Enable LOGGING by removing '#' - Disable LOGGING by prepending '#' or skipping
export POOL_LOG="--log-file=/var/log/xmrig.log"

wget -O installer.sh https://github.com/BlockChasers/xmrig-autoinstall/raw/main/xmrig-installer.sh

chmod +x installer.sh

./installer.sh
```

### Auto Install XMRig (HiveOS)
```
# USE --coin <coin> OR CHANGE TO --algo <algo>
export POOL_COIN="--coin monero"

export POOL_HOST=gulf.moneroocean.stream
export POOL_PORT=10001
export POOL_USER=MY_MONERO_ADDRESS
export POOL_PASS=MY_POOL_PASS

# Enable LOGGING by removing '#' - Disable LOGGING by prepending '#' or skipping
export POOL_LOG="--log-file=/var/log/xmrig.log"

wget -O installer.sh https://github.com/BlockChasers/xmrig-autoinstall/raw/main/hiveos-xmrig-installer.sh

chmod +x installer.sh

./installer.sh
```
