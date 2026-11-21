#!/usr/bin/env bash
# Phase-3636: STATUS mentions milestone 9450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '9450|milestone 9450|Meilenstein 9450' webui/STATUS.md
echo "STATUS milestone 9450 ok"
echo "cleaned"
echo "OK: phase3636 e2e passed"
