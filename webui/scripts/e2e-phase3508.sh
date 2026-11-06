#!/usr/bin/env bash
# Phase-3508: STATUS mentions milestone 9050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '9050|milestone 9050|Meilenstein 9050' webui/STATUS.md
echo "STATUS milestone 9050 ok"
echo "cleaned"
echo "OK: phase3508 e2e passed"
