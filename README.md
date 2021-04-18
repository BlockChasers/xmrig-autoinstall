# xmrig-installer

This script will auto install XMRig as a service, start the service with logging, and enable at boot time.

This script was initially hacked for HiveOS as it will overwrite/uninstall XMRig when HiveOS updates. 
Doing all this work over and over does not sound like fun, so this will make it a one line install process.

Monitor logs with `tail -f /var/log/xmrig.log`

Plans to add logrotate in future. Script can be re-run with new parameters but it will delete XMRig and re-git/compile.

### Auto Install XMRig
```
export $POOL_HOST=gulf.moneroocean.stream
export $POOL_PORT=10001
export $POOL_USER=MY_MONERO_ADDRESS
export $POOL_PASS=MY_POOL_PASS

# Enable TLS by removing '#' - Disable TLS by prepending '#' or skipping
#export $POOL_TLS="--tls"

wget -O installer.sh https://github.com/BlockChasers/xmrig-autoinstall/raw/main/xmrig-installer.sh

chmod +x installer.sh

./installer.sh
```

### Auto Install XMRig (HiveOS)
```
export $POOL_HOST=gulf.moneroocean.stream
export $POOL_PORT=10001
export $POOL_USER=MY_MONERO_ADDRESS
export $POOL_PASS=MY_POOL_PASS

wget -O installer.sh https://github.com/BlockChasers/xmrig-autoinstall/raw/main/hiveos-xmrig-installer.sh

chmod +x installer.sh

./installer.sh
```
