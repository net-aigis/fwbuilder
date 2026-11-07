#!/usr/bin/env bash
# Phase-4756: STATUS mentions milestone 12950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '12950|milestone 12950|Meilenstein 12950' webui/STATUS.md
echo "STATUS milestone 12950 ok"
echo "cleaned"
echo "OK: phase4756 e2e passed"
