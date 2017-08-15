#!/bin/bash
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
args=()
args+=( '-autoupdate' )
args+=( '-console' )
(( ${#GAME_TYPE} >= 1 )) && args+=( '-game $GAME_TYPE' )
(( ${#WORKSHOP_KEY} >= 1 )) && args+=( '-authkey $WORKSHOP_KEY' )
(( ${#WORKSHOP_ID} >= 1 )) && args+=( '+host_workshop_collection $WORKSHOP_ID' )
(( ${#MAX_PLAYERS} >= 1 )) && args+=( '+maxplayers $MAX_PLAYERS' )
(( ${#GAME_MODE} >= 1 )) && args+=( '+gamemode $GAME_MODE' )
(( ${#MAP} >= 1 )) && args+=( '+map $MAP' )
./srcds_run "${args[@]}"
