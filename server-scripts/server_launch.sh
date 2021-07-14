######################
# Set launch options #
######################
ARGS="-game csgo -console -autoupdate -usercon $ARGS"

if [ -v SERVER_TOKEN ]
then
    ARGS="$ARGS +sv_setsteamaccount $SERVER_TOKEN"
fi
if [ -v PASSWORD ]
then
    ARGS="$ARGS +sv_password $PASSWORD"
fi
if [ -v RCON_PASSWORD ]
then
    ARGS="$ARGS +rcon_password $RCON_PASSWORD"
fi
if [ -v GOTV_PASSWORD ]
then
    ARGS="$ARGS +tv_password $GOTV_PASSWORD"
fi
if [ -v  PUBLIC_ADDRESS ]
then
    ARGS="$ARGS +net_public_adr $PUBLIC_ADDRESS"
fi
if [ -v IP ]
then
    ARGS="$ARGS -ip $IP"
else
    ARGS="$ARGS -ip 0.0.0.0"
fi
if [ -v PORT ]
then
    ARGS="$ARGS -port $PORT"
fi
if [ -v GOTV_PORT ]
then
    ARGS="$ARGS +tv_port $GOTV_PORT"
fi
if [ -v CLIENT_PORT ]
then
    ARGS="$ARGS +clientport $CLIENT_PORT"
fi
if [ -v TICKRATE ]
then
    ARGS="$ARGS -tickrate $TICKRATE"
else
    ARGS="$ARGS -tickrate 128"
fi
if [ -v MAXPLAYERS ]
then
    ARGS="$ARGS -maxplayers_override $MAXPLAYERS"
else
    ARGS="$ARGS -maxplayers_override 10"
fi
if [ -v GAMETYPE ]
then
    ARGS="$ARGS +game_type $GAMETYPE"
else
    ARGS="$ARGS +game_type 0"
fi
if [ -v GAMEMODE ]
then
    ARGS="$ARGS +game_mode $GAMEMODE"
else
    ARGS="$ARGS +game_mode 1"
fi
if [ -v MAPGROUP ]
then
    ARGS="$ARGS +mapgroup $MAPGROUP"
else
    ARGS="$ARGS +mapgroup mg_active"
fi
if [ -v MAP ]
then
    ARGS="$ARGS +map $MAP"
else
    ARGS="$ARGS +map de_mirage"
fi
if [ -v HOST_WORKSHOP_COLLECTION ]
then
    ARGS="$ARGS +host_workshop_collection $HOST_WORKSHOP_COLLECTION"
fi
if [ -v WORKSHOP_START_MAP ]
then
    ARGS="$ARGS +workshop_start_map $WORKSHOP_START_MAP"
fi
if [ -v WORKSHOP_AUTHKEY ]
then
    ARGS="$ARGS -authkey $WORKSHOP_AUTHKEY"
fi
if [ -v AUTOEXEC ]
then
    ARGS="$ARGS +exec $AUTOEXEC"
fi
if [ -v MATCH_CONFIG ]
then
    echo $MATCH_CONFIG > $CSGO_DIR/csgo/match_config.json
else
    echo 'get5_check_auths 0' > $CSGO_DIR/csgo/cfg/sourcemod/get5.cfg
fi

#################
# Launch server #
#################
cd $CSGO_DIR
./srcds_run $ARGS
