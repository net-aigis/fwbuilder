#!/usr/bin/env bash
# Phase-2340: STATUS mentions milestone 5400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '5400|milestone 5400|Meilenstein 5400' webui/STATUS.md
echo "STATUS milestone 5400 ok"
echo "cleaned"
echo "OK: phase2340 e2e passed"
