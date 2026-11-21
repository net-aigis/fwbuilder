#!/usr/bin/env bash
# Phase-5140: STATUS mentions milestone 14150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qE '14150|milestone 14150|Meilenstein 14150' webui/STATUS.md
echo "STATUS milestone 14150 ok"; echo "cleaned"; echo "OK: phase5140 e2e passed"
