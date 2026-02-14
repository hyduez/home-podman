#!/usr/bin/bash
set -e

LOCK_FILE="$HOME/.pods_service_lock"

if [ -f "$LOCK_FILE" ]; then
  echo "Pods service already running, exiting"
  exit 0
fi

touch "$LOCK_FILE"

trap 'rm -f "$LOCK_FILE"' EXIT

for d in $HOME/Workspaces/*/; do
  [ -d "$d" ] && (
    cd "$d" || exit
    if ! podman ps --format '{{.Names}}' | grep -q -x "$(basename "$d")"; then
    	podman-compose up -d
    	sleep 10
    fi
  )
done
