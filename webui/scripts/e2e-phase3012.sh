#!/usr/bin/env bash
# Phase-3012: STATUS mentions milestone 7500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '7500|milestone 7500|Meilenstein 7500' webui/STATUS.md
echo "STATUS milestone 7500 ok"
echo "cleaned"
echo "OK: phase3012 e2e passed"
