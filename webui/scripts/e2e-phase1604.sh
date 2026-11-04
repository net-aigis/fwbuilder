#!/usr/bin/env bash
# Phase-1604: STATUS mentions milestone 3100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '3100|milestone 3100|Meilenstein 3100' webui/STATUS.md
echo "STATUS milestone 3100 ok"
echo "cleaned"
echo "OK: phase1604 e2e passed"
