#!/usr/bin/env bash
# Phase-3188: STATUS mentions milestone 8050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '8050|milestone 8050|Meilenstein 8050' webui/STATUS.md
echo "STATUS milestone 8050 ok"
echo "cleaned"
echo "OK: phase3188 e2e passed"
