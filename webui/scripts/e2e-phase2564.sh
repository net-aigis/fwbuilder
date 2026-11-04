#!/usr/bin/env bash
# Phase-2564: STATUS mentions milestone 6100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '6100|milestone 6100|Meilenstein 6100' webui/STATUS.md
echo "STATUS milestone 6100 ok"
echo "cleaned"
echo "OK: phase2564 e2e passed"
