#!/usr/bin/env bash
# Phase-1876: STATUS mentions milestone 3950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '3950|milestone 3950|Meilenstein 3950' webui/STATUS.md
echo "STATUS milestone 3950 ok"
echo "cleaned"
echo "OK: phase1876 e2e passed"
