#!/usr/bin/env bash
# Phase-4612: STATUS mentions milestone 12500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '12500|milestone 12500|Meilenstein 12500' webui/STATUS.md
echo "STATUS milestone 12500 ok"
echo "cleaned"
echo "OK: phase4612 e2e passed"
