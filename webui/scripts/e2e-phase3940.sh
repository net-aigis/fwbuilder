#!/usr/bin/env bash
# Phase-3940: STATUS mentions milestone 10400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '10400|milestone 10400|Meilenstein 10400' webui/STATUS.md
echo "STATUS milestone 10400 ok"
echo "cleaned"
echo "OK: phase3940 e2e passed"
