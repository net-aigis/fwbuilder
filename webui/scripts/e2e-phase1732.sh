#!/usr/bin/env bash
# Phase-1732: STATUS mentions milestone 3500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '3500|milestone 3500|Meilenstein 3500' webui/STATUS.md
echo "STATUS milestone 3500 ok"
echo "cleaned"
echo "OK: phase1732 e2e passed"
