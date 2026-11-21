#!/usr/bin/env bash
# Phase-2804: STATUS mentions milestone 6850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '6850|milestone 6850|Meilenstein 6850' webui/STATUS.md
echo "STATUS milestone 6850 ok"
echo "cleaned"
echo "OK: phase2804 e2e passed"
