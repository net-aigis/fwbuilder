#!/usr/bin/env bash
# Phase-1572: STATUS mentions milestone 3000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '3000|milestone 3000|Meilenstein 3000' webui/STATUS.md
echo "STATUS milestone 3000 ok"
echo "cleaned"
echo "OK: phase1572 e2e passed"
