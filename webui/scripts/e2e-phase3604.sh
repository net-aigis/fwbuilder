#!/usr/bin/env bash
# Phase-3604: STATUS mentions milestone 9350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '9350|milestone 9350|Meilenstein 9350' webui/STATUS.md
echo "STATUS milestone 9350 ok"
echo "cleaned"
echo "OK: phase3604 e2e passed"
