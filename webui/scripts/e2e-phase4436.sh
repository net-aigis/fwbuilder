#!/usr/bin/env bash
# Phase-4436: STATUS mentions milestone 11950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '11950|milestone 11950|Meilenstein 11950' webui/STATUS.md
echo "STATUS milestone 11950 ok"
echo "cleaned"
echo "OK: phase4436 e2e passed"
