#!/bin/sh

BIND_IP=0.0.0.0
if command -v tailscale > /dev/null; then
    BIND_IP="$(tailscale ip -4)"
fi
export BIND_IP
docker-compose up -d
