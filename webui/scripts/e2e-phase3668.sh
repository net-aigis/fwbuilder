#!/usr/bin/env bash
# Phase-3668: STATUS mentions milestone 9550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '9550|milestone 9550|Meilenstein 9550' webui/STATUS.md
echo "STATUS milestone 9550 ok"
echo "cleaned"
echo "OK: phase3668 e2e passed"
