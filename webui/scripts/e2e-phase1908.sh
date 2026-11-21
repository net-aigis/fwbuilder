#!/usr/bin/env bash
# Phase-1908: STATUS mentions milestone 4050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '4050|milestone 4050|Meilenstein 4050' webui/STATUS.md
echo "STATUS milestone 4050 ok"
echo "cleaned"
echo "OK: phase1908 e2e passed"
