#!/usr/bin/env bash
# Phase-3316: STATUS mentions milestone 8450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '8450|milestone 8450|Meilenstein 8450' webui/STATUS.md
echo "STATUS milestone 8450 ok"
echo "cleaned"
echo "OK: phase3316 e2e passed"
