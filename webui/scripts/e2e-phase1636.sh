#!/usr/bin/env bash
# Phase-1636: STATUS mentions milestone 3200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '3200|milestone 3200|Meilenstein 3200' webui/STATUS.md
echo "STATUS milestone 3200 ok"
echo "cleaned"
echo "OK: phase1636 e2e passed"
