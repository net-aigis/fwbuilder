#!/usr/bin/env bash
# Phase-2660: STATUS mentions milestone 6400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '6400|milestone 6400|Meilenstein 6400' webui/STATUS.md
echo "STATUS milestone 6400 ok"
echo "cleaned"
echo "OK: phase2660 e2e passed"
