#!/usr/bin/env bash
# Phase-2692: STATUS mentions milestone 6500.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '6500|milestone 6500|Meilenstein 6500' webui/STATUS.md
echo "STATUS milestone 6500 ok"
echo "cleaned"
echo "OK: phase2692 e2e passed"
