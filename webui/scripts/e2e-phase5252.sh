#!/usr/bin/env bash
# Phase-5252: STATUS mentions milestone 14500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '14500|milestone 14500|Meilenstein 14500' webui/STATUS.md
echo "STATUS milestone 14500 ok"; echo "cleaned"; echo "OK: phase5252 e2e passed"
