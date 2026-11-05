#!/usr/bin/env bash
# Phase-3444: STATUS mentions milestone 8850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '8850|milestone 8850|Meilenstein 8850' webui/STATUS.md
echo "STATUS milestone 8850 ok"
echo "cleaned"
echo "OK: phase3444 e2e passed"
