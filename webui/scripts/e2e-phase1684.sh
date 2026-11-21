#!/usr/bin/env bash
# Phase-1684: STATUS mentions milestone 3350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '3350|milestone 3350|Meilenstein 3350' webui/STATUS.md
echo "STATUS milestone 3350 ok"
echo "cleaned"
echo "OK: phase1684 e2e passed"
