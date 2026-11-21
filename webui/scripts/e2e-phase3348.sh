#!/usr/bin/env bash
# Phase-3348: STATUS mentions milestone 8550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '8550|milestone 8550|Meilenstein 8550' webui/STATUS.md
echo "STATUS milestone 8550 ok"
echo "cleaned"
echo "OK: phase3348 e2e passed"
