#!/usr/bin/env bash
# Phase-1892: STATUS mentions milestone 4000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '4000|milestone 4000|Meilenstein 4000' webui/STATUS.md
echo "STATUS milestone 4000 ok"
echo "cleaned"
echo "OK: phase1892 e2e passed"
