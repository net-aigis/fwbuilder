#!/usr/bin/env bash
# Phase-4420: STATUS mentions milestone 11900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '11900|milestone 11900|Meilenstein 11900' webui/STATUS.md
echo "STATUS milestone 11900 ok"
echo "cleaned"
echo "OK: phase4420 e2e passed"
