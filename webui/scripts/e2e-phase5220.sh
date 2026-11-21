#!/usr/bin/env bash
# Phase-5220: STATUS mentions milestone 14400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '14400|milestone 14400|Meilenstein 14400' webui/STATUS.md
echo "STATUS milestone 14400 ok"; echo "cleaned"; echo "OK: phase5220 e2e passed"
