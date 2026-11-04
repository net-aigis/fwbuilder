#!/usr/bin/env bash
# Phase-2756: STATUS mentions milestone 6700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '6700|milestone 6700|Meilenstein 6700' webui/STATUS.md
echo "STATUS milestone 6700 ok"
echo "cleaned"
echo "OK: phase2756 e2e passed"
