#!/usr/bin/env bash
# Phase-3620: STATUS mentions milestone 9400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '9400|milestone 9400|Meilenstein 9400' webui/STATUS.md
echo "STATUS milestone 9400 ok"
echo "cleaned"
echo "OK: phase3620 e2e passed"
