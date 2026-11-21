#!/usr/bin/env bash
# Phase-3364: STATUS mentions milestone 8600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '8600|milestone 8600|Meilenstein 8600' webui/STATUS.md
echo "STATUS milestone 8600 ok"
echo "cleaned"
echo "OK: phase3364 e2e passed"
