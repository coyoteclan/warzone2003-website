#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ ! -d "$DIR/game_data" ]; then
  printf 'Directory "%s/game_data" not found.\n' "$DIR"
  read -rp "Press Enter to continue..." _
  exit 1
fi

(
  cd "$DIR/game_data" || exit 1
  nohup ./codlinux &
  disown
)
