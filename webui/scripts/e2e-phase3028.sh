#!/usr/bin/env bash
# Phase-3028: STATUS mentions milestone 7550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '7550|milestone 7550|Meilenstein 7550' webui/STATUS.md
echo "STATUS milestone 7550 ok"
echo "cleaned"
echo "OK: phase3028 e2e passed"
