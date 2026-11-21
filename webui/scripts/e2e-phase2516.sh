#!/usr/bin/env bash
# Phase-2516: STATUS mentions milestone 5950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '5950|milestone 5950|Meilenstein 5950' webui/STATUS.md
echo "STATUS milestone 5950 ok"
echo "cleaned"
echo "OK: phase2516 e2e passed"
