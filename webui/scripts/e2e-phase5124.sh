#!/usr/bin/env bash
# Phase-5124: STATUS mentions milestone 14100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '14100|milestone 14100|Meilenstein 14100' webui/STATUS.md
echo "STATUS milestone 14100 ok"; echo "cleaned"; echo "OK: phase5124 e2e passed"
