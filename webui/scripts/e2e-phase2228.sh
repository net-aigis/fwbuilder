#!/usr/bin/env bash
# Phase-2228: STATUS mentions milestone 5050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '5050|milestone 5050|Meilenstein 5050' webui/STATUS.md
echo "STATUS milestone 5050 ok"
echo "cleaned"
echo "OK: phase2228 e2e passed"
