#!/bin/sh
mantaro_ip=${MANTARO_IP:-host}
mantaro_base_port=${MANTARO_BASE_PORT:-9900}
mantaro_node_count=${MANTARO_NODE_COUNT:-4}

patreon_ip=${MANTARO_PATREON_IP:-host}
patreon_base_port=${MANTARO_PATREON_BASE_PORT:-9900}
patreon_node_count=${MANTARO_PATREON_NODE_COUNT:-1}

gen_script=$(dirname $(readlink -f $0))/gen_nodes.sh

$gen_script mantaro         $mantaro_ip $mantaro_base_port $mantaro_node_count > /etc/prometheus/mantaro.json
$gen_script mantaro-patreon $patreon_ip $patreon_base_port $patreon_node_count > /etc/prometheus/patreon.json

/bin/prometheus "$@"
