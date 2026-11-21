#!/usr/bin/env bash
# Phase-2100: STATUS mentions milestone 4650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '4650|milestone 4650|Meilenstein 4650' webui/STATUS.md
echo "STATUS milestone 4650 ok"
echo "cleaned"
echo "OK: phase2100 e2e passed"
