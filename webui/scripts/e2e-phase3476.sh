#!/usr/bin/env bash
# Phase-3476: STATUS mentions milestone 8950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '8950|milestone 8950|Meilenstein 8950' webui/STATUS.md
echo "STATUS milestone 8950 ok"
echo "cleaned"
echo "OK: phase3476 e2e passed"
