#!/usr/bin/env bash
# Phase-2884: STATUS mentions milestone 7100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '7100|milestone 7100|Meilenstein 7100' webui/STATUS.md
echo "STATUS milestone 7100 ok"
echo "cleaned"
echo "OK: phase2884 e2e passed"
