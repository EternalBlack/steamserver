# Plesk Onyx Docker Steam Server

This container provides a way for a fast and easy setup of servers provided by steamcmd via docker.
Initially designed for use with Plesk Onyx it provides a variety of arguments for you to make installation as easy as possible.
It defaults to a garrysmod server setup with the following setup:

| Argument | Default | Description |
| ------ | ------ | ------ |
| APPID | **4020** | The AppID that is used for installation via steamcmd |
| MAP | **gm_construct** | Adds `+map $MAP` to the run arguments of ./srcds_run |
| GAME_TYPE | **garrysmod** | Adds `-game $GAME_TYPE` to the run arguments of ./srcds_run |
| WORKSHOP_KEY | *empty* | Adds `-authkey WORKSHOP_KEY` to the run arguments of ./srcds_run |
| WORKSHOP_ID | *empty* | Adds `+host_workshop_collection WORKSHOP_ID` to the run arguments of ./srcds_run |
| GAME_MODE | **Sandbox** | Adds `+gamemode GAME_MODE` to the run arguments of ./srcds_run |
| MAX_PLAYERS | **64** | Adds `+maxplayers MAX_PLAYERS` to the run arguments of ./srcds_run |

By default `-console` and `-autoupdate` is enabled
