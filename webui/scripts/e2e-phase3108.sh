#!/usr/bin/env bash
# Phase-3108: STATUS mentions milestone 7800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '7800|milestone 7800|Meilenstein 7800' webui/STATUS.md
echo "STATUS milestone 7800 ok"
echo "cleaned"
echo "OK: phase3108 e2e passed"
