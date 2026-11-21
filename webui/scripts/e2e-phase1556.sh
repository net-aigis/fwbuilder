#!/usr/bin/env bash
# Phase-1556: STATUS mentions milestone 2950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '2950|milestone 2950|Meilenstein 2950' webui/STATUS.md
echo "STATUS milestone 2950 ok"
echo "cleaned"
echo "OK: phase1556 e2e passed"
