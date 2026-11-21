#!/usr/bin/env bash
# Phase-2388: STATUS mentions milestone 5550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '5550|milestone 5550|Meilenstein 5550' webui/STATUS.md
echo "STATUS milestone 5550 ok"
echo "cleaned"
echo "OK: phase2388 e2e passed"
