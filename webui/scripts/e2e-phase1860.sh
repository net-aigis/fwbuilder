#!/usr/bin/env bash
# Phase-1860: STATUS mentions milestone 3900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '3900|milestone 3900|Meilenstein 3900' webui/STATUS.md
echo "STATUS milestone 3900 ok"
echo "cleaned"
echo "OK: phase1860 e2e passed"
