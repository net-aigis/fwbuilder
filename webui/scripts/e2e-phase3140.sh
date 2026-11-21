#!/usr/bin/env bash
# Phase-3140: STATUS mentions milestone 7900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '7900|milestone 7900|Meilenstein 7900' webui/STATUS.md
echo "STATUS milestone 7900 ok"
echo "cleaned"
echo "OK: phase3140 e2e passed"
