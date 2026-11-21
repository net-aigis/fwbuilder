#!/usr/bin/env bash
# Phase-3332: STATUS mentions milestone 8500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '8500|milestone 8500|Meilenstein 8500' webui/STATUS.md
echo "STATUS milestone 8500 ok"
echo "cleaned"
echo "OK: phase3332 e2e passed"
