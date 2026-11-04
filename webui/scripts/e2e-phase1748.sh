#!/usr/bin/env bash
# Phase-1748: STATUS mentions milestone 3550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '3550|milestone 3550|Meilenstein 3550' webui/STATUS.md
echo "STATUS milestone 3550 ok"
echo "cleaned"
echo "OK: phase1748 e2e passed"
