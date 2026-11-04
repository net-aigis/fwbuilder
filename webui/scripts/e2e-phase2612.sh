#!/usr/bin/env bash
# Phase-2612: STATUS mentions milestone 6250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '6250|milestone 6250|Meilenstein 6250' webui/STATUS.md
echo "STATUS milestone 6250 ok"
echo "cleaned"
echo "OK: phase2612 e2e passed"
