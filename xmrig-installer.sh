
echo "UPDATE / UPGRADE"

apt update

apt upgrade -y ; apt dist-upgrade -y ;

echo "INSTALLING REQ'D PACKAGES"

apt install -y dialog logrotate ntp ntpdate cpulimit ${APT_REQ_PKGS} ;

echo "CREATING DIRECTORIES"

mkdir -p ${INSTALL_DIR}
cd ${INSTALL_DIR}

echo "CLONING XMRIG"

rm -rf ${DIR_NAME}
git clone ${GIT_SRC_URL} ${DIR_NAME}

cd ${DIR_NAME}

echo "CMAKE XMRIG"

cmake ./

echo "MAKE XMRIG"

make

chmod +x xmrig

echo "INSTALLING XMRIG SERVICE"

export $HOSTNAME=$(cat /etc/hostname)

echo "HOSTNAME IS [ ${HOSTNAME} ]"

echo "[Unit]" | tee /etc/systemd/system/xmrig.service
echo "Description=XMRIG service" | tee -a /etc/systemd/system/xmrig.service
echo "After=network.target" | tee -a /etc/systemd/system/xmrig.service
echo "StartLimitIntervalSec=0" | tee -a /etc/systemd/system/xmrig.service
echo "[Service]" | tee -a /etc/systemd/system/xmrig.service
echo "Type=simple" | tee -a /etc/systemd/system/xmrig.service
echo "Restart=always" | tee -a /etc/systemd/system/xmrig.service
echo "RestartSec=3" | tee -a /etc/systemd/system/xmrig.service
echo "User=root" | tee -a /etc/systemd/system/xmrig.service
echo "ExecStart=${INSTALL_DIR}/${DIR_NAME}/xmrig ${POOL_COIN} ${POOL_TLS} -o ${POOL_HOST}:${POOL_PORT} -u ${POOL_USER} -p ${POOL_PASS} ${POOL_LOG} --donate-level=0" | tee -a /etc/systemd/system/xmrig.service
echo "" | tee -a /etc/systemd/system/xmrig.service
echo "[Install]" | tee -a /etc/systemd/system/xmrig.service
echo "WantedBy=multi-user.target" | tee -a /etc/systemd/system/xmrig.service

echo "STARTING XMRIG/SERVICES"

service logrotate start
service ntp start
service xmrig start

echo "STARTING XMRIG/SERVICES @ BOOT"

systemctl enable logrotate
systemctl enable ntp
systemctl enable xmrig

#EOF
