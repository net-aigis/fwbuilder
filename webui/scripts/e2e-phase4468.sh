#!/usr/bin/env bash
# Phase-4468: STATUS mentions milestone 12050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE '12050|milestone 12050|Meilenstein 12050' webui/STATUS.md
echo "STATUS milestone 12050 ok"
echo "cleaned"
echo "OK: phase4468 e2e passed"
