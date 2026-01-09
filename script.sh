#!/usr/bin/bash

for d in */; do [ -d "$d" ] && cd "$d" && podman-compose up -d && cd ..; done
