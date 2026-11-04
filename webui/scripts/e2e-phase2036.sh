#!/usr/bin/env bash
# Phase-2036: STATUS mentions milestone 4450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '4450|milestone 4450|Meilenstein 4450' webui/STATUS.md
echo "STATUS milestone 4450 ok"
echo "cleaned"
echo "OK: phase2036 e2e passed"
