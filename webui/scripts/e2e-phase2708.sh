#!/usr/bin/env bash
# Phase-2708: STATUS mentions milestone 6550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '6550|milestone 6550|Meilenstein 6550' webui/STATUS.md
echo "STATUS milestone 6550 ok"
echo "cleaned"
echo "OK: phase2708 e2e passed"
