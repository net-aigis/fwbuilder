#!/usr/bin/env bash
# Phase-2292: STATUS mentions milestone 5250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '5250|milestone 5250|Meilenstein 5250' webui/STATUS.md
echo "STATUS milestone 5250 ok"
echo "cleaned"
echo "OK: phase2292 e2e passed"
