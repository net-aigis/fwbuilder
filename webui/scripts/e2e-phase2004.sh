#!/usr/bin/env bash
# Phase-2004: STATUS mentions milestone 4350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '4350|milestone 4350|Meilenstein 4350' webui/STATUS.md
echo "STATUS milestone 4350 ok"
echo "cleaned"
echo "OK: phase2004 e2e passed"
