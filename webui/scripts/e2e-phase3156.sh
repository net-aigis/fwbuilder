#!/usr/bin/env bash
# Phase-3156: STATUS mentions milestone 7950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '7950|milestone 7950|Meilenstein 7950' webui/STATUS.md
echo "STATUS milestone 7950 ok"
echo "cleaned"
echo "OK: phase3156 e2e passed"
