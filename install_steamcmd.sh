#!/bin/sh
STEAMCMD_FILE=steamcmd_installer
mkdir ~/steamcmd
cd ~/steamcmd
wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -O $STEAMCMD_FILE
tar -xvzf $STEAMCMD_FILE
# installing csgo dedicated server
~/steamcmd/steamcmd.sh +login anonymous +force_install_dir ~/csgo +app_update $APPID validate +quit
# fixing popd/pushd
sed -i "s/\#\!\/bin\/sh/\#\!\/bin\/bash/" ~/csgo/srcds_run
# removing install file
rm $STEAMCMD_FILE
# executing server
echo "Executing server."
cd ~/csgo
./srcds_run -game garrysmod -console -usercon +maxplayers 32 +map $MAP
