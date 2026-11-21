#!/usr/bin/env bash
# Phase-3300: STATUS mentions milestone 8400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '8400|milestone 8400|Meilenstein 8400' webui/STATUS.md
echo "STATUS milestone 8400 ok"
echo "cleaned"
echo "OK: phase3300 e2e passed"
