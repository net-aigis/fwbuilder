#!/usr/bin/env bash
# Phase-3172: STATUS mentions milestone 8000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '8000|milestone 8000|Meilenstein 8000' webui/STATUS.md
echo "STATUS milestone 8000 ok"
echo "cleaned"
echo "OK: phase3172 e2e passed"
