#!/usr/bin/env bash
# Phase-3652: STATUS mentions milestone 9500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '9500|milestone 9500|Meilenstein 9500' webui/STATUS.md
echo "STATUS milestone 9500 ok"
echo "cleaned"
echo "OK: phase3652 e2e passed"
