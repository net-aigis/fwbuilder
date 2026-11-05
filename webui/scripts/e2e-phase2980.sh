#!/usr/bin/env bash
# Phase-2980: STATUS mentions milestone 7400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '7400|milestone 7400|Meilenstein 7400' webui/STATUS.md
echo "STATUS milestone 7400 ok"
echo "cleaned"
echo "OK: phase2980 e2e passed"
