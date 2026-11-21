#!/usr/bin/env bash
# Phase-3044: STATUS mentions milestone 7600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '7600|milestone 7600|Meilenstein 7600' webui/STATUS.md
echo "STATUS milestone 7600 ok"
echo "cleaned"
echo "OK: phase3044 e2e passed"
