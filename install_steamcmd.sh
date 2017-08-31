#!/bin/sh
STEAMCMD_FILE=steamcmd_installer
mkdir ~/steamcmd
cd ~/steamcmd
wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -O $STEAMCMD_FILE
tar -xvzf $STEAMCMD_FILE
# installing server dedicated server
~/steamcmd/steamcmd.sh +login anonymous +force_install_dir ~/garrysmod +app_update $APPID validate +quit
# update TF2 server
~/steamcmd/steamcmd.sh +login anonymous +force_install_dir ~/tf2 +app_update 232250 validate +quit
# update CSS server
~/steamcmd/steamcmd.sh +login anonymous +force_install_dir ~/css +app_update 232330 validate +quit
# fixing popd/pushd
sed -i "s/\#\!\/bin\/sh/\#\!\/bin\/bash/" ~/garrysmod/srcds_run
# removing install file
rm $STEAMCMD_FILE
# executing server
echo "Executing server."
cd ~/garrysmod
args=()
(( ${#GAME_TYPE} >= 1 )) && args+=( "-game $GAME_TYPE" )
args+=( '-console' )
args+=( '-autoupdate' )
args+=( '-condebug' )
(( ${#WORKSHOP_KEY} >= 1 )) && args+=( "-authkey $WORKSHOP_KEY" )
(( ${#WORKSHOP_ID} >= 1 )) && args+=( "+host_workshop_collection $WORKSHOP_ID" )
(( ${#MAX_PLAYERS} >= 1 )) && args+=( "+maxplayers $MAX_PLAYERS" )
(( ${#MAP} >= 1 )) && args+=( "+map $MAP" )
(( ${#GAME_MODE} >= 1 )) && args+=( "+gamemode $GAME_MODE" )

~/garrysmod/srcds_run "${args[@]}"
