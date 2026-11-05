#!/usr/bin/env bash
# Phase-3396: STATUS mentions milestone 8700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '8700|milestone 8700|Meilenstein 8700' webui/STATUS.md
echo "STATUS milestone 8700 ok"
echo "cleaned"
echo "OK: phase3396 e2e passed"
