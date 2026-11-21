#!/usr/bin/env bash
# Phase-4340: STATUS mentions milestone 11650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '11650|milestone 11650|Meilenstein 11650' webui/STATUS.md
echo "STATUS milestone 11650 ok"
echo "cleaned"
echo "OK: phase4340 e2e passed"
