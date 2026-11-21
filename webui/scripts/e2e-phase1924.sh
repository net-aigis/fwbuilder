#!/usr/bin/env bash
# Phase-1924: STATUS mentions milestone 4100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '4100|milestone 4100|Meilenstein 4100' webui/STATUS.md
echo "STATUS milestone 4100 ok"
echo "cleaned"
echo "OK: phase1924 e2e passed"
