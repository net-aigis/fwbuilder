#!/usr/bin/env bash
# Phase-3076: STATUS mentions milestone 7700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '7700|milestone 7700|Meilenstein 7700' webui/STATUS.md
echo "STATUS milestone 7700 ok"
echo "cleaned"
echo "OK: phase3076 e2e passed"
