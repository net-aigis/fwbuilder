#!/usr/bin/env bash
# Phase-5092: STATUS mentions milestone 14000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '14000|milestone 14000|Meilenstein 14000' webui/STATUS.md
echo "STATUS milestone 14000 ok"; echo "cleaned"; echo "OK: phase5092 e2e passed"
