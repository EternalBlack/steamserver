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
args=()
(( ${#GAME_TYPE} >= 1 )) && args+=( "-game $GAME_TYPE" )
args+=( '-console' )
args+=( '-autoupdate' )
(( ${#WORKSHOP_KEY} >= 1 )) && args+=( "-autoupdate $WORKSHOP_KEY" )
(( ${#WORKSHOP_ID} >= 1 )) && args+=( "+host_workshop_collection $WORKSHOP_ID" )
(( ${#MAX_PLAYERS} >= 1 )) && args+=( "+maxplayers $MAX_PLAYERS" )
(( ${#MAP} >= 1 )) && args+=( "+map $MAP" )
(( ${#GAME_MODE} >= 1 )) && args+=( "+gamemode $GAME_MODE" )

./srcds_run "${args[@]}"
