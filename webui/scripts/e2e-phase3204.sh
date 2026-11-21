#!/usr/bin/env bash
# Phase-3204: STATUS mentions milestone 8100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '8100|milestone 8100|Meilenstein 8100' webui/STATUS.md
echo "STATUS milestone 8100 ok"
echo "cleaned"
echo "OK: phase3204 e2e passed"
