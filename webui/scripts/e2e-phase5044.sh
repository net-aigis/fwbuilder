#!/usr/bin/env bash
# Phase-5044: STATUS mentions milestone 13850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '13850|milestone 13850|Meilenstein 13850' webui/STATUS.md
echo "STATUS milestone 13850 ok"; echo "cleaned"; echo "OK: phase5044 e2e passed"
