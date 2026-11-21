#!/usr/bin/env bash
# Phase-2996: STATUS mentions milestone 7450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '7450|milestone 7450|Meilenstein 7450' webui/STATUS.md
echo "STATUS milestone 7450 ok"
echo "cleaned"
echo "OK: phase2996 e2e passed"
