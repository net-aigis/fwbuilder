#!/usr/bin/env bash
# Phase-3380: STATUS mentions milestone 8650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '8650|milestone 8650|Meilenstein 8650' webui/STATUS.md
echo "STATUS milestone 8650 ok"
echo "cleaned"
echo "OK: phase3380 e2e passed"
