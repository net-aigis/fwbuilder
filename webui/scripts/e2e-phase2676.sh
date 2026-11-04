#!/usr/bin/env bash
# Phase-2676: STATUS mentions milestone 6450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '6450|milestone 6450|Meilenstein 6450' webui/STATUS.md
echo "STATUS milestone 6450 ok"
echo "cleaned"
echo "OK: phase2676 e2e passed"
