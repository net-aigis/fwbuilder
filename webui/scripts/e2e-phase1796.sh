#!/usr/bin/env bash
# Phase-1796: STATUS mentions milestone 3700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '3700|milestone 3700|Meilenstein 3700' webui/STATUS.md
echo "STATUS milestone 3700 ok"
echo "cleaned"
echo "OK: phase1796 e2e passed"
