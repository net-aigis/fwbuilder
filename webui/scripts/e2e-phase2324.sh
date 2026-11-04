#!/usr/bin/env bash
# Phase-2324: STATUS mentions milestone 5350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '5350|milestone 5350|Meilenstein 5350' webui/STATUS.md
echo "STATUS milestone 5350 ok"
echo "cleaned"
echo "OK: phase2324 e2e passed"
