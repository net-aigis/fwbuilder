#!/usr/bin/env bash
# Phase-2420: STATUS mentions milestone 5650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '5650|milestone 5650|Meilenstein 5650' webui/STATUS.md
echo "STATUS milestone 5650 ok"
echo "cleaned"
echo "OK: phase2420 e2e passed"
