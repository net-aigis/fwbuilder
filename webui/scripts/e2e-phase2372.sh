#!/usr/bin/env bash
# Phase-2372: STATUS mentions milestone 5500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '5500|milestone 5500|Meilenstein 5500' webui/STATUS.md
echo "STATUS milestone 5500 ok"
echo "cleaned"
echo "OK: phase2372 e2e passed"
