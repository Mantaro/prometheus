# How to configure

Create a file called `prom-variables.env` with the following contents:

```
BIND_IP=<ip to listen for prometheus connections on>

MANTARO_IP=<replace me>
MANTARO_BASE_PORT=<replace me>
MANTARO_NODE_COUNT=<replace me>

MANTARO_PATREON_IP=<replace me>
MANTARO_PATREON_BASE_PORT=<replace me>
MANTARO_PATREON_NODE_COUNT=<replace me>
```

An ip of `host` means the docker host ip (use this if prometheus is inside a docker container but the
bot is running as a host process)

An ip of `none` disables metrics collection for the bot.

Start prometheus with `./start.sh`
