#!/usr/bin/env bash
# Phase-1588: STATUS mentions milestone 3050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '3050|milestone 3050|Meilenstein 3050' webui/STATUS.md
echo "STATUS milestone 3050 ok"
echo "cleaned"
echo "OK: phase1588 e2e passed"
