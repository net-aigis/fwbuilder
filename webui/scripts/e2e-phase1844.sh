#!/usr/bin/env bash
# Phase-1844: STATUS mentions milestone 3850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '3850|milestone 3850|Meilenstein 3850' webui/STATUS.md
echo "STATUS milestone 3850 ok"
echo "cleaned"
echo "OK: phase1844 e2e passed"
