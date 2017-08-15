#!/bin/sh
STEAMCMD_FILE=steamcmd_installer
mkdir ~/steamcmd
cd ~/steamcmd
wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -O $STEAMCMD_FILE
tar -xvzf $STEAMCMD_FILE
# installing server dedicated server
~/steamcmd/steamcmd.sh +login anonymous +force_install_dir ~/server +app_update $APPID validate +quit
# fixing popd/pushd
sed -i "s/\#\!\/bin\/sh/\#\!\/bin\/bash/" ~/server/srcds_run
# removing install file
rm $STEAMCMD_FILE
# executing server
echo "Executing server."
cd ~/server
./srcds_run -game $GAME_TYPE -console -autoupdate if [ ${#WORKSHOP_KEY} >= 1 ]; then echo "-authkey $WORKSHOP_KEY"; fi if [ ${#WORKSHOP_ID} >= 1 ]; then echo "+host_workshop_collection $WORKSHOP_ID"; fi +maxplayers 32 +map $MAP +gamemode $GAME_MODE 
