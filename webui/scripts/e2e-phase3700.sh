#!/usr/bin/env bash
# Phase-3700: STATUS mentions milestone 9650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '9650|milestone 9650|Meilenstein 9650' webui/STATUS.md
echo "STATUS milestone 9650 ok"
echo "cleaned"
echo "OK: phase3700 e2e passed"
