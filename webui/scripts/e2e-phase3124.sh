#!/usr/bin/env bash
# Phase-3124: STATUS mentions milestone 7850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '7850|milestone 7850|Meilenstein 7850' webui/STATUS.md
echo "STATUS milestone 7850 ok"
echo "cleaned"
echo "OK: phase3124 e2e passed"
