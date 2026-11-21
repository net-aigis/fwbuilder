#!/usr/bin/env bash
# Phase-1700: STATUS mentions milestone 3400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '3400|milestone 3400|Meilenstein 3400' webui/STATUS.md
echo "STATUS milestone 3400 ok"
echo "cleaned"
echo "OK: phase1700 e2e passed"
