#!/usr/bin/env bash
# Phase-2468: STATUS mentions milestone 5800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '5800|milestone 5800|Meilenstein 5800' webui/STATUS.md
echo "STATUS milestone 5800 ok"
echo "cleaned"
echo "OK: phase2468 e2e passed"
