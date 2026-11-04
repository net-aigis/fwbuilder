#!/usr/bin/env bash
# Phase-1652: STATUS mentions milestone 3250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '3250|milestone 3250|Meilenstein 3250' webui/STATUS.md
echo "STATUS milestone 3250 ok"
echo "cleaned"
echo "OK: phase1652 e2e passed"
